# Maintainer: Zane Fernandes
pkgname=lowkey-git
pkgver=r5.67be110
pkgrel=1
pkgdesc="A customizable notification daemon"
arch=('x86_64')
url="https://github.com/ZaneFerns360/lowkey"
license=('MIT')
depends=(
  'boost-libs'
  'libnotify'
)
makedepends=(
  'cmake'
  'git'
  'boost'
)
optdepends=(
  'dunst: Lightweight and customizable notification daemon'
  'mako: Lightweight notification daemon for Wayland'
)
provides=(
  'lowkey'
)
conflicts=(
  'lowkey'
)
source=("git+$url.git")
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/$pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  cd "$pkgname"
}

build() {
  cmake -B build -S "$pkgname" \
    -DCMAKE_BUILD_TYPE=None
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}

