# Maintainer : Skydrome <skydrome@i2pmail.org>
# Contributor: DaNiMoTh <jjdanimoth@gmail.com>
# Contributor (Arch): Peter Simons <simons@cryp.to>
# Contributor (Arch): Nicolas Pouillard <nicolas.pouillard@gmail.com>

pkgname=tahoe-lafs
pkgver=1.11.0
pkgrel=1
pkgdesc="Secure, decentralized, and fault-tolerant filesystem."
url='https://tahoe-lafs.org/trac/tahoe-lafs'
license=('GPL')
arch=('any')
conflicts=('tahoe-lafs-i2p')
BUILDENV+=(!check)

depends=('openssl>=1.0.2'
         'python2-twisted>=15.1.0'
         'python2-pyopenssl>=0.14'
         'python2-pyasn1>=0.1.8'
         'python2-pyasn1-modules>=0.0.5'
         'python2-zope-interface>=4.0.5'
         'python2-characteristic>=14.3.0'
         'python2-service-identity>=14.0.0'
         'python2-cryptography'
         'pyutil>=1.9.4'
         'python2-simplejson>=3.1.3'
         'nevow>=0.11.1'
         'zbase32>=1.1.5'
         'zfec>=1.4.24'
         'pycryptopp>=0.6.0'
         'python2-cffi'
         'python2-enum34'
         'python2-pycparser'
         'python2-six'
         'libffi'
         'python2-foolscap>=0.10.1'
         'net-tools' # provides /sbin/ifconfig
         'python2-setuptools')

optdepends=('python2-numpy: reliability test')

source=("https://tahoe-lafs.org/downloads/tahoe-lafs-$pkgver.tar.bz2"
        "https://tahoe-lafs.org/downloads/tahoe-lafs-$pkgver.tar.bz2.asc")

sha256sums=('b1611b0b6dab35f6541b46d03b749b7ee668e0403aa4d9b3bdb5aeacf2413743'
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
