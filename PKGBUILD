# Maintainer: Igor Dyatlov <dyatlov.igor@protonmail.com>

pkgname=patterns-git
pkgver=r37.770a676
pkgrel=1
pkgdesc="GNOME patterns"
arch=('any')
url="https://gitlab.gnome.org/exalm/patterns"
license=('MIT')
depends=('glib2' 'gtk4' 'libadwaita' 'libsass' 'sassc')
makedepends=('git' 'meson' 'gcc')
source=(git+$url.git)
md5sums=(SKIP) #autofill using updpkgsums

pkgver() {
  cd "$srcdir/${pkgname%-git}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  arch-meson "${pkgname%-git}" build
  meson compile -C build
}

check() {
  meson test -C build --print-errorlogs
}

package() {
  DESTDIR="${pkgdir}" meson install -C build
}
