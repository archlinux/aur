# Maintainer: Nicolas Pouillard <nicolas.pouillard@gmail.com>
# Contributor: Peter Simons <simons@cryp.to>

pkgname=pycryptopp
pkgver=0.7.1
_pkgtag=869544967005693312591928092448767568728501330214
pkgrel=1

pkgdesc="Python wrappers for the Crypto++ library"
arch=('i686' 'x86_64')
url='http://allmydata.org/trac/pycryptopp'
license=('GPL')
makedepends=('python2-setuptools')
depends=('python2' 'crypto++')

source=("https://pypi.python.org/packages/7c/e2/7e035d306c7516c471802d7cd7b6c1e403e582489bc5c14706854a187a24/$pkgname-$pkgver.$_pkgtag.tar.gz")

#key 242BE85F: public key "Zooko Wilcox-O'Hearn (Hacker) <zooko@zooko.com>"
validpgpkeys=('A60B7EE17164D0C5F13738685F22F428242BE85F')
sha256sums=('08ad57a1a39b7ed23c173692281da0b8d49d98ad3dcc09f8cca6d901e142699f')

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
