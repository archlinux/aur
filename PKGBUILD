# Maintainer: Justin Kim <jeongseok.kim@sk.com>

pkgname=gaeguli-git
pkgver=r352.1dca553
pkgrel=2
pkgdesc='[gæguli] is a library for video streaming using SRT'
arch=('x86_64')
url='https://github.com/hwangsaeul/gaeguli'
license=('APACHE-2.0')
conflicts=('gaeguli')
provides=('gaeguli')
source=('git+https://github.com/hwangsaeul/gaeguli.git')
sha256sums=('SKIP')

makedepends=(git meson ninja)
depends=(gst-plugins-bad srt json-glib libnl)

pkgver() {
    cd gaeguli
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
    cd gaeguli

    meson --prefix /usr build
    ninja -C build
}

package() {
    cd gaeguli
    DESTDIR="$pkgdir" ninja -C build install
}
