# Maintainer: Igor Dyatlov <dyatlov.igor@protonmail.com>

pkgname=hackgregator-git
pkgver=0.4.0.r0.ge78c2ac
pkgrel=2
pkgdesc="This application is a comfortable reader application for news.ycombinator.com"
arch=('x86_64' 'aarch64')
url="https://gitlab.com/gunibert/hackgregator"
license=('GPL3')
depends=('libadwaita' 'libsoup3' 'json-glib' 'webkit2gtk-5.0')
makedepends=('git' 'meson' 'cargo')
checkdepends=('appstream-glib')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=(git+$url.git)
b2sums=('SKIP')

pkgver() {
  cd "${pkgname%-git}"
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  arch-meson "${pkgname%-git}" build
  meson compile -C build
}

check() {
  meson test -C build || :
}

package() {
  meson install -C build --destdir "$pkgdir"
}
