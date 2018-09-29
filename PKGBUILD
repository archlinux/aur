# Maintainer: CrocoDuck <crocoduck dot oducks at gmail dot com>

pkgname=noise-repellent-git
pkgver=r572.60167c0
pkgrel=1
pkgdesc="An lv2 plugin for broadband noise reduction."
arch=('i686' 'x86_64')
url="https://github.com/lucianodato/noise-repellent"
license=('LGPL3')
depends=('fftw')
makedepends=('git' 'lv2' 'meson')
provides=("${pkgname%-*}")
conflicts=("${pkgname%-*}")
source=("${pkgname%-*}::git+https://github.com/lucianodato/noise-repellent.git")
md5sums=('SKIP')

pkgver() {
  cd "${pkgname%-*}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
    cd "${pkgname%-*}"
    meson --prefix "/usr/lib/lv2" --buildtype=release build
    ninja -v -C build
    ninja -C build test
}

package() {
    cd "${pkgname%-*}"
    DESTDIR="$pkgdir" ninja -C build install
}
