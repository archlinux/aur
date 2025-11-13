# Maintainer: Jaume Delclòs <jaume@delclos.com>
pkgname=blue-spider-git
pkgver=r171.62ce79a
pkgrel=1
pkgdesc="A map editor for Pokémon GBA ROMs"
arch=(any)
url="https://github.com/cosarara97/blue-spider"
license=('GPL-3.0-or-later')
depends=('python' 'python-pillow' 'python-pyqt5' 'python-appdirs')
makedepends=(
  git
  python-build
  python-installer
  python-setuptools
  python-wheel
)
options=(!emptydirs)
source=('blue-spider::git+https://github.com/cosarara97/blue-spider.git')
md5sums=(SKIP)

pkgver() {
  cd "$srcdir/blue-spider"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "$srcdir/blue-spider"
  python -m build --wheel --no-isolation
}

package() {
  cd "$srcdir/blue-spider"
  python -m installer --destdir="$pkgdir" dist/*.whl
}

# vim:set ts=2 sw=2 et:
