pkgname=myosd-git
pkgver=r16.40bef1b
pkgrel=1
pkgdesc="OSD customizado para hyprland escrito em C++ e GTKmm"
arch=('x86_64')
url="https://github.com/moretto08/my-osd"
license=('GPLv2')
depends=('gtkmm3' 'glibc' 'pamixer' 'brightnessctl' 'gtk-layer-shell')
makedepends=('git')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=("${pkgname}::git+${url}.git")
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/$pkgname"

  local commit count

  commit=$(git log -n1 --format="%h" -- \
    main.cpp \
    Makefile \
    style.css \
    scripts/)

  count=$(git rev-list --count HEAD -- \
    main.cpp \
    Makefile \
    style.css \
    scripts/)

  printf "r%s.g%s" "$count" "$commit"
}

build() {
  cd "$srcdir/$pkgname"
  make
}

package() {
  cd "$srcdir/$pkgname"
  make DESTDIR="$pkgdir" PREFIX="/usr" install
}
