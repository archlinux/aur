# Maintainer: Igor Dyatlov <dyatlov.igor@protonmail.com>

pkgname=highscore-git
pkgver=40.0.r221.g5ce721ce
pkgrel=2
pkgdesc="Highscore is a retro gaming application for the GNOME desktop"
arch=('any')
url="https://gitlab.gnome.org/World/highscore"
license=('GPL3')
depends=('tracker' 'grilo' 'grilo-plugins' 'glib2' 'libsass' 'sassc' 'gtk4' 'libadwaita' 'libhandy' 'libevdev' 'libmanette' 'libarchive' 'retro-gtk-git' 'librsvg' 'libsoup' 'sqlite' 'libxml2')
makedepends=('git' 'cmake' 'meson' 'gcc' 'vala')
optdepends=('libretro')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
replaces=('gnome-games')
source=(git+$url.git)
md5sums=(SKIP) #autofill using updpkgsums

pkgver() {
  cd "$srcdir/${pkgname%-git}"
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
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
