_pkgname=deluge-plugins-pieces
pkgname="$_pkgname-git"
pkgver=r66.a9dfb9e
pkgrel=1
pkgdesc='Deluge plugin to show the status of each piece of a torrent in deluge'
arch=('any')
url=https://github.com/petroid/Deluge-Pieces-Plugin
license=('GPL3')
makedepends=(
  git
  python-setuptools
)
source=("$_pkgname::git+https://github.com/petroid/Deluge-Pieces-Plugin.git")
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/$_pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  cd "$srcdir/$_pkgname"

  python setup.py bdist_egg

  install -Dm644 dist/*.egg ${pkgdir}/usr/lib/python3.10/site-packages/deluge/plugins/Pieces.egg
}
