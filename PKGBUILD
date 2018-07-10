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

#key 242BE85F: public key "Zooko Wilcox-O'Hearn (Hacker) <zooko@zooko.com>"
validpgpkeys=('A60B7EE17164D0C5F13738685F22F428242BE85F')
source=("https://files.pythonhosted.org/packages/source/p/$pkgname/$pkgname-$pkgver.$_pkgtag.tar.gz"
        'api_change.patch')
sha256sums=('08ad57a1a39b7ed23c173692281da0b8d49d98ad3dcc09f8cca6d901e142699f'
            '9d9cfa52ad93b8662cb8ecfd3c7f82129394735dab41142fe1ad7f66267df3e2')

prepare() {
    cd "$srcdir/$pkgname-$pkgver.$_pkgtag/src"
    patch -Np1 -i "$srcdir/api_change.patch"
}

build() {
    cd "$srcdir/$pkgname-$pkgver.$_pkgtag"
    export PYCRYPTOPP_DISABLE_EMBEDDED_CRYPTOPP=1
    python2 setup.py build
}

check() {
    cd "$srcdir/$pkgname-$pkgver.$_pkgtag"
    python2 setup.py test
}

package() {
    cd "$srcdir/$pkgname-$pkgver.$_pkgtag"
    python2 setup.py install --root="$pkgdir" --optimize=1 --skip-build
}
