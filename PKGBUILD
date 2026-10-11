# Maintainer: Herlin Chavarria <253316889+movacx@users.noreply.github.com>
pkgname=melfpaint
pkgver=1.2.0
pkgrel=1
pkgdesc="Editor de imágenes de escritorio con capas, pinceles y formas"
arch=('any')
url="https://github.com/movacx/MelfPaint"
license=('GPL-3.0-or-later')
depends=('python>=3.11' 'pyside6' 'python-numpy' 'hicolor-icon-theme')
optdepends=(
  'python-pillow: guardar y abrir GIF, TIFF, WebP e ICO aunque Qt no tenga el códec'
  'qt6-imageformats: códecs nativos de WebP y TIFF'
  'qt6-translations: botones y atajos de Qt en español'
)
makedepends=('make')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('b95a84cb7c0f60af5c43a591d525c8dbeaa4097f1d92b32012089674f90c6f12')

build() {
  cd "MelfPaint-$pkgver"
  python -m compileall -q app/backend app/frontend app/main.py app/version.py >/dev/null
}

check() {
  cd "MelfPaint-$pkgver"
  make test PYTHON=python
}

package() {
  cd "MelfPaint-$pkgver"
  make install DESTDIR="$pkgdir" PREFIX=/usr PYTHON=/usr/bin/python3
  python -m compileall -q -d /usr/share/melfpaint "$pkgdir/usr/share/melfpaint" >/dev/null
}
