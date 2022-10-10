# Maintainer: Carlos van Rooijen <aur at carlosvanrooijen dot nl>
pkgname=unpaper-git
pkgver=6.r299.a2a88fe
pkgrel=1
epoch=
pkgdesc="Post-processing tool for scanned sheets of paper."
arch=('i686' 'x86_64')
url="https://github.com/unpaper/unpaper"
license=('GPL')
groups=()
depends=('ffmpeg')
makedepends=('git')
optdepends=()
checkdepends=()
provides=('unpaper')
conflicts=('unpaper')
replaces=()
backup=()
options=()
changelog=
install=
source=("$pkgname::git+https://github.com/unpaper/unpaper.git")
noextract=()
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/$pkgname"
  printf "6.r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  arch-meson $pkgname build
  meson compile -C build
}

check() {
  meson test -C build --print-errorlogs
}

package() {
  meson install -C build --destdir "$pkgdir"
}
