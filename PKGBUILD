pkgname=win2x11cursor-git
pkgver=1.0.0.r9.gc3fe391
pkgrel=1
pkgdesc="Convert Windows cursor themes into installable X11/Xcursor themes"
arch=('any')
url='https://github.com/tantaihaha4487/win2x11cursor'
license=('GPL-3.0-or-later')
depends=('python' 'win2xcur' 'imagemagick')
makedepends=('git' 'python-build' 'python-installer' 'python-setuptools' 'python-wheel')
optdepends=(
  'libarchive: extract 7z, cab, and fallback RAR archives'
  'unrar: extract RAR archives'
)
provides=('win2x11cursor')
conflicts=('win2x11cursor')
source=("$pkgname::git+https://github.com/tantaihaha4487/win2x11cursor.git")
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/$pkgname"
  printf '1.0.0.r%s.g%s' "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "$srcdir/$pkgname"
  python -m build --wheel --no-isolation
}

check() {
  cd "$srcdir/$pkgname"
  PYTHONPATH=src python -m unittest discover -s tests
}

package() {
  cd "$srcdir/$pkgname"
  python -m installer --destdir="$pkgdir" dist/*.whl
}
