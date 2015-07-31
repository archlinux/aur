# Maintainer : Skydrome <skydrome@i2pmail.org>
# Contributor: DaNiMoTh <jjdanimoth@gmail.com>
# Contributor (Arch): Peter Simons <simons@cryp.to>
# Contributor (Arch): Nicolas Pouillard <nicolas.pouillard@gmail.com>

pkgname=tahoe-lafs
pkgver=1.10.2
pkgrel=1
pkgdesc="Secure, decentralized, and fault-tolerant filesystem."
url='https://tahoe-lafs.org/trac/tahoe-lafs'
license=('GPL')
arch=('any')
conflicts=('tahoe-lafs-i2p')
BUILDENV+=(!check)

depends=('openssl>=1.0.2'
         'python2-twisted>=13.0.0'
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
         'python2-foolscap>=0.8.0'
         'net-tools' # provides /sbin/ifconfig
         'python2-setuptools')

optdepends=('python2-numpy: reliability test')

source=("https://tahoe-lafs.org/source/tahoe-lafs/releases/allmydata-tahoe-$pkgver.tar.bz2")
sha256sums=('fed5d719c966d9528a45e8ad66e6c8ff3dcb3c06db94775194c7c75566047be7')

build(){
    cd "${srcdir}/allmydata-tahoe-${pkgver}"
    python2 setup.py build
}

check() {
    cd "${srcdir}/allmydata-tahoe-${pkgver}"
    msg "This may take a while"
    python2 bin/tahoe debug trial $MAKEFLAGS
}

package(){
    cd "${srcdir}/allmydata-tahoe-${pkgver}"
    python2 setup.py install --root="$pkgdir" --optimize=1
    install -Dm644 COPYING.GPL "${pkgdir}/usr/share/licenses/${pkgname}/COPYING"
}
