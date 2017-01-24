# Maintainer : Skydrome <skydrome@i2pmail.org>
# Contributor: DaNiMoTh <jjdanimoth@gmail.com>
# Contributor (Arch): Peter Simons <simons@cryp.to>
# Contributor (Arch): Nicolas Pouillard <nicolas.pouillard@gmail.com>

pkgname=tahoe-lafs
pkgver=1.12.1
pkgrel=1
pkgdesc="Secure, decentralized, and fault-tolerant filesystem."
url='https://tahoe-lafs.org/trac/tahoe-lafs'
license=('GPL')
arch=('any')
conflicts=('tahoe-lafs-i2p')
BUILDENV+=(!check)

depends=('openssl>=1.0.2'
         'python2-twisted>=16.1.0'
         'python2-pyopenssl>=0.14'
         'python2-pyasn1>=0.1.8'
         'python2-pyasn1-modules>=0.0.5'
         'python2-zope-interface>=4.0.5'
         'python2-characteristic>=14.3.0'
         'python2-service-identity>=14.0.0'
         'python2-cryptography'
         'pyutil>=1.9.4'
         'python2-simplejson>=3.1.3'
         'nevow>=0.12.0'
         'zbase32>=1.1.5'
         'zfec>=1.4.24'
         'pycryptopp>=0.6.0'
         'python2-cffi'
         'python2-enum34'
         'python2-pycparser'
         'python2-six'
         'libffi'
         'python2-foolscap>=0.12.6'
         'net-tools' # provides /sbin/ifconfig
         'python2-setuptools'
         'python2-shutilwhich>=1.1.0'
         'python2-yaml'
         'python2-crypto>=2.6')

optdepends=('python2-numpy: reliability test')

source=("https://tahoe-lafs.org/downloads/tahoe-lafs-$pkgver.tar.bz2"
        "https://tahoe-lafs.org/downloads/tahoe-lafs-$pkgver.tar.bz2.asc")

# https://tahoe-lafs.org/downloads/tahoe-release-signing-gpg-key.asc
sha256sums=('7a2eeb0522d888cd98887605837827ab55f43ff058176aae432884eae50c2e75'
            'SKIP')

validpgpkeys=('E34E62D06D0E69CFCA4179FFBDE0D31D68666A7A')

build(){
    cd "${srcdir}/tahoe-lafs-${pkgver}"
    python2 setup.py build
}

check() {
    cd "${srcdir}/tahoe-lafs-${pkgver}"
    msg "This may take a while"
    python2 bin/tahoe debug trial $MAKEFLAGS
}

package(){
    cd "${srcdir}/tahoe-lafs-${pkgver}"
    python2 setup.py install --root="$pkgdir" --optimize=1
    install -Dm644 COPYING.GPL "${pkgdir}/usr/share/licenses/${pkgname}/COPYING"
}
