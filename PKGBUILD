# Maintainer: Igor Dyatlov <dyatlov.igor@protonmail.com>

pkgname=millionaire-git
pkgver=1.0.2.r1.g838b719
pkgrel=1
pkgdesc="Who Wants to Be a Millionaire game"
arch=('x86_64' 'aarch64')
url="https://github.com/martinszeltins/who-wants-to-be-a-millionaire"
license=('GPL2')
depends=('libadwaita')
makedepends=('git' 'blueprint-compiler' 'meson')
checkdepends=('appstream-glib')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=(${pkgname%-git}::git+$url.git)
b2sums=('SKIP')

pkgver() {
  cd "${pkgname%-git}"
  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  arch-meson "${pkgname%-git}" build
  meson compile -C build
}

check() {
  meson test -C build --print-errorlogs || :
}

package() {
  meson install -C build --destdir "$pkgdir"
}
