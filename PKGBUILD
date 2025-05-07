# Maintainer: Chocobo1 <chocobo1 AT archlinux DOT net>
# Previous maintainer: The-Repo-Club <The-Repo-Club@github.com>

pkgname=qt6gtk2-git
pkgver=0.4.r2.gd7c14be
pkgrel=1
pkgdesc="GTK+2.0 integration plugins for Qt6"
arch=('i686' 'x86_64')
url="https://www.opencode.net/trialuser/qt6gtk2"
license=('GPL-2.0-or-later')
depends=('gcc-libs' 'gtk2' 'libx11' 'qt6-base')
makedepends=('git')
provides=("qt6gtk2=$pkgver")
conflicts=('qt6gtk2')
source=("git+https://www.opencode.net/trialuser/qt6gtk2.git")
sha256sums=('SKIP')


pkgver() {
  cd "qt6gtk2"

  _tag=$(git tag -l --sort -v:refname | grep -E '^v?[0-9\.]+$' | head -n1)
  _rev=$(git rev-list --count $_tag..HEAD)
  _hash=$(git rev-parse --short HEAD)
  printf "%s.r%s.g%s" "$_tag" "$_rev" "$_hash" | sed 's/^v//'
}

build() {
  cd "qt6gtk2"

  qmake6
  make
}

package() {
  cd "qt6gtk2"

  make INSTALL_ROOT="$pkgdir" install
}
