# Maintainer: pierspad <pierpaolospadafora@proton.me>
pkgname=textmerger
pkgver=1.0.6
pkgrel=2
pkgdesc="A Python GUI application for merging text files"
arch=('any')
url="https://github.com/pierspad/TextMerger"
license=('MIT')
depends=('python' 'python-pyqt5' 'python-flask' 'python-werkzeug')
makedepends=('python-build' 'python-installer' 'python-wheel' 'python-setuptools')
optdepends=('python-pip: for installing optional dependencies like nbformat for Jupyter notebook support')
source=("$pkgname-$pkgver.tar.gz")
sha256sums=('a50d02830c5cdd36bd5bac854be56f331dd2f56bc5a561813c69a10498f65742')

prepare() {
  cd "$srcdir/TextMerger-$pkgver"
}

build() {
  cd "$srcdir/TextMerger-$pkgver"
  unset VIRTUAL_ENV
  export PATH="/usr/bin:/bin:/usr/sbin:/sbin"
  /usr/bin/python -m build --wheel --no-isolation
}

check() {
  cd "$srcdir/TextMerger-$pkgver"
}

package() {
  cd "$srcdir/TextMerger-$pkgver"
  /usr/bin/python -m installer --destdir="$pkgdir" dist/*.whl

  install -Dm644 docs/LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

  install -Dm644 packaging/textmerger.desktop "$pkgdir/usr/share/applications/textmerger.desktop"

  install -Dm644 textmerger/assets/logo/logo.png "$pkgdir/usr/share/pixmaps/textmerger.png"
}
