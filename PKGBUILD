# Maintainer: Igor Dyatlov <dyatlov.igor@protonmail.com>

pkgname=lorem-git
pkgver=1.1.r0.g144b3a1
pkgrel=1
pkgdesc="Simple app to generate the Lorem Ipsum placeholder text"
arch=('x86_64' 'aarch64')
url="https://gitlab.gnome.org/World/design/lorem"
license=('GPL3')
depends=('libadwaita')
makedepends=('git' 'meson' 'cargo')
checkdepends=('appstream-glib')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=(git+$url.git)
b2sums=('SKIP')

pkgver() {
  cd "${pkgname%-git}"
  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  arch-meson ${pkgname%-git} build
  meson compile -C build
}

check() {
  meson test -C build --print-errorlogs || :
}

package() {
  meson install -C build --destdir "$pkgdir"
}
