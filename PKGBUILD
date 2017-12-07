# Maintainer: Ainola

pkgname=python-vipaccess
pkgver=0.3.0
pkgrel=1
pkgdesc="A free software implementation of Symantec's VIP Access application and protocol."
arch=('any')
url="https://github.com/cyrozap/python-vipaccess"
license=('apache')
makedepends=('python-setuptools')
depends=('python' 'python-crypto' 'python-image' 'python-lxml'
         'python-oath' 'python-qrcode' 'python-requests')
source=("https://github.com/cyrozap/python-vipaccess/archive/v$pkgver.tar.gz"
        "check_token.patch")
sha256sums=('6d1d9a8fe632e2de7213aad5d881d32dd367cac450cdc907e8d0f77589c9c23a'
            '02bcef0ee35f72da56ac89ce7cc447039d306a564a6551a3f66928066bac66a3')

prepare() {
  # https://github.com/zecoj/python-vipaccess/commit/34b6ce697429892141ad511d5e8e4b95e40abb98
  patch -d "python-vipaccess-$pkgver" -p1 < check_token.patch
}

build() {
  cd "$srcdir/python-vipaccess-$pkgver"
  python setup.py build
}

package() {
  cd "$srcdir/python-vipaccess-$pkgver"
  python setup.py install --root="$pkgdir/" --optimize=1
}
