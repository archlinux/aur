# Maintainer: pierspad <pierpaolospadafora@proton.me>
pkgname=textmerger
pkgver=1.1.0
pkgrel=2
pkgdesc="A Python GUI application for merging text files"
arch=('any')
url="https://github.com/pierspad/TextMerger"
license=('MIT')
depends=('python' 'python-pyqt5' 'python-flask' 'python-werkzeug')
makedepends=('python-build' 'python-installer' 'python-wheel' 'python-setuptools')
optdepends=('python-pip: for installing optional dependencies like nbformat for Jupyter notebook support')
source=("$pkgname-$pkgver.tar.gz::https://github.com/pierspad/TextMerger/archive/v$pkgver.tar.gz")
sha256sums=('12856a9f9351109ee84928c39f394b5bc975b02e631ccdd0e0e3b5f1f3c05dbc')

prepare() {
  cd "$srcdir/textmerger-$pkgver"
}

build() {
  cd "$srcdir/textmerger-$pkgver"
  unset VIRTUAL_ENV
  export PATH="/usr/bin:/bin:/usr/sbin:/sbin"
  /usr/bin/python -m build --wheel --no-isolation
}

check() {
  cd "$srcdir/textmerger-$pkgver"
}

package() {
  cd "$srcdir/textmerger-$pkgver"
  /usr/bin/python -m installer --destdir="$pkgdir" dist/*.whl

  install -Dm644 docs/LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

  install -Dm644 packaging/textmerger.desktop "$pkgdir/usr/share/applications/textmerger.desktop"

  install -Dm644 textmerger/assets/logo/logo.png "$pkgdir/usr/share/pixmaps/textmerger.png"
}
