# Maintainer: GI_Jack <GI_Jack@hackermail.com>
# Old Maintainer : Skydrome <skydrome@i2pmail.org>
# Contributor: DaNiMoTh <jjdanimoth@gmail.com>
# Contributor (Arch): Peter Simons <simons@cryp.to>
# Contributor (Arch): Nicolas Pouillard <nicolas.pouillard@gmail.com>

pkgname=tahoe-lafs
pkgver=1.13.0
pkgrel=3
pkgdesc="Secure, decentralized, and fault-tolerant filesystem."
url='https://tahoe-lafs.org/trac/tahoe-lafs'
license=('GPL')
arch=('any')
conflicts=('tahoe-lafs-i2p')
replaces=('tahoe-lafs-i2p')
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
         'python2-pyutil>=1.9.4'
         'python2-simplejson>=3.1.3'
         'nevow>=0.12.0'
         'python2-zbase32>=1.1.5'
         'python2-zfec>=1.4.24'
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
         'python2-pycryptodome')

optdepends=('python2-numpy: reliability test')

source=("https://tahoe-lafs.org/downloads/tahoe-lafs-$pkgver.tar.bz2"
        "https://tahoe-lafs.org/downloads/tahoe-lafs-$pkgver.tar.bz2.asc")

# https://tahoe-lafs.org/downloads/tahoe-release-signing-gpg-key.asc
sha256sums=('82d4d20f2672e67927d91e73e54dbfd7e526eca27dea09a29f131bef7dfaee86'
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
