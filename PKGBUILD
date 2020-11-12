# Maintainer: Martin Stolpe <martin dot stolpe at gmail dot com>
# Contributor: Antonio Rojas <arojas@archlinux.org>

_pkgname=plasma-vault
pkgname=plasma-vault-git
pkgver=r302.4375903
pkgrel=1
pkgdesc="Plasma applet and services for creating encrypted vaults"
arch=(x86_64)
url="https://www.kde.org/"
license=(LGPL)
groups=(plasma)
depends=(plasma-workspace-git networkmanager-qt-git)
makedepends=(extra-cmake-modules git)
optdepends=('encfs: to use encFS for encryption' 'cryfs: to use cryFS for encryption' 'gocryptfs: to use gocryptfs for encryption')
conflicts=(plasma-vault)
provides=(plasma-vault)
source=("git+https://invent.kde.org/plasma/$_pkgname.git")
sha256sums=('SKIP')

pkgver() {
  cd $srcdir/$_pkgname
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cmake -B build -S $_pkgname \
    -DBUILD_TESTING=OFF
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}
