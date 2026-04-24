pkgname=myosd-git
pkgver=r16.40bef1b
pkgrel=1
pkgdesc="OSD customizado para hyprland escrito em C++ e GTKmm"
arch=('x86_64')
url="https://github.com/moretto08/my-osd"
license=('GPLv2')
depends=('gtkmm3' 'glibc' 'pamixer' 'brightnessctl' 'gtk-layer-shell')
makedepends=('git' 'cmake')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=("${pkgname}::git+${url}.git")
sha256sums=('SKIP')

pkgver() {
  cd "$pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "$srcdir/$pkgname"
  make
}

package() {
  cd "$srcdir/$pkgname"
  make DESTDIR="$pkgdir" PREFIX="/usr" install
}
