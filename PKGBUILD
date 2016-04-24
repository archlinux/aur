# Maintainer: Nicolas Pouillard <nicolas.pouillard@gmail.com>
# Contributor: Peter Simons <simons@cryp.to>

pkgname=pycryptopp
pkgver=0.6.0
_pkgtag=1206569328141510525648634803928199668821045408958
pkgrel=2

pkgdesc="Python wrappers for the Crypto++ library"
arch=('i686' 'x86_64')
url='http://allmydata.org/trac/pycryptopp'
license=('GPL')
makedepends=('python2-setuptools')
depends=('python2' 'crypto++')

source=("https://pypi.python.org/packages/source/p/$pkgname/$pkgname-$pkgver.$_pkgtag.tar.gz"
        "https://pypi.python.org/packages/source/p/$pkgname/$pkgname-$pkgver.$_pkgtag.tar.gz.asc")

#key 242BE85F: public key "Zooko Wilcox-O'Hearn (Hacker) <zooko@zooko.com>"
validpgpkeys=('A60B7EE17164D0C5F13738685F22F428242BE85F')
sha256sums=('116158917bd243da2701cfeba9a6374854bc9a599d1466e1a2dbadf37c802059'
            'SKIP')

build() {
    cd "$srcdir/$pkgname-$pkgver.$_pkgtag"
    export PYCRYPTOPP_USE_SYSTEM_CRYPTOPP_WITH_ASM=1
    export PYCRYPTOPP_DISABLE_EMBEDDED_CRYPTOPP=1
    python2 setup.py build
}

check() {
    cd "$srcdir/$pkgname-$pkgver.$_pkgtag"
    python2 setup.py test
}

package() {
    cd "$srcdir/$pkgname-$pkgver.$_pkgtag"
    python2 setup.py install --root="$pkgdir"
}
