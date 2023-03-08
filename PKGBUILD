# Maintainer: bziemons <ben@rs485.network>
pkgname=tuiwidgets-git
pkgver=r617.12a497a
pkgrel=1
pkgdesc="Terminal user inferface toolkit"
arch=("x86_64")
url="https://github.com/tuiwidgets/tuiwidgets"
license=('Boost')
depends=('qt5-base' 'termpaint-git' 'posixsignalmanager-git')
makedepends=(meson git)
provides=(tuiwidgets)
conflicts=(tuiwidgets)
options=(strip)
source=("git+https://github.com/tuiwidgets/tuiwidgets.git")
md5sums=("SKIP")

pkgver() {
    cd "tuiwidgets"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
    arch-meson tuiwidgets _build
    meson compile -C _build
}

check() {
    meson test -C _build
}

package() {
    DESTDIR="$pkgdir" meson install -C _build
}
