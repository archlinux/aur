# Maintainer: Igor Dyatlov <dyatlov.igor@protonmail.com>
# Contributor: Gustavo Peredo <gustavomperedo@protonmail.com>

pkgname=font-downloader-git
_pkgname=font-downloader
pkgver=r302.333b715
pkgrel=1
pkgdesc="A simple GTK font downloader"
arch=('any')
url="https://github.com/GustavoPeredo/font-downloader"
license=('GPL3')
depends=('gtk3' 'libhandy' 'python' 'python-gobject')
makedepends=('git' 'meson' 'ninja')
source=(git+$url.git)
b2sums=('SKIP')

pkgver() {
  cd "$_pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  arch-meson $_pkgname build
  meson compile -C build
}

check() {
  meson test -C build --print-errorlogs
}

package() {
  DESTDIR="$pkgdir" ninja install -C build
}
