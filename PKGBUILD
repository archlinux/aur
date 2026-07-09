# Maintainer: Thomas Lübking <thomas.luebking@gmail.com>
# Contributor: Fabio 'Lolix' Loli <fabio.loli@disroot.org>
# Contributor: Federico Di Pierro, prash

pkgname=qarma-git
pkgver=r123.42afa9a
pkgrel=1
pkgdesc="A drop-in replacement clone for zenity, written in Qt, Qt6 build"
arch=(x86_64 i686)
url="https://github.com/luebking/qarma"
license=(GPL-2.0-only)
depends=(qt6-base)
makedepends=(git)
provides=(qarma zenity)
conflicts=(qarma zenity)
source=("git+https://github.com/luebking/qarma")
sha256sums=("SKIP")

pkgver() {
  cd qarma
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd qarma
  qmake6
  make
}

package() {
  cd qarma
  install -Dm755 qarma -t "$pkgdir/usr/bin"
  ln -s /usr/bin/qarma "$pkgdir/usr/bin/qarma-askpass"
  ln -s /usr/bin/qarma "$pkgdir/usr/bin/zenity"
}
