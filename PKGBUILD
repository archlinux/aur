# Maintainer:  Lukas K. <lu@0x83.eu>

_name=horizon
pkgname=${_name}-git
pkgver=r3086.2be2035e
pkgrel=2
pkgdesc="free EDA package written in C++"
arch=('x86_64' 'i686')
url="https://github.com/horizon-eda/horizon"
license=('GPL')
depends=('zeromq' 'gtkmm3' 'cairomm' 'librsvg' 'sqlite3' 'libgit2' 'curl' 'opencascade' 'podofo-0.9' 'libarchive' 'cppzmq' 'libspnav')
makedepends=('glm' 'meson' 'cmake')
source=("git+https://github.com/horizon-eda/horizon.git")
md5sums=('SKIP')
conflicts=('horizon-eda')

pkgver() {
    cd "$srcdir/$_name"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
    arch-meson "$srcdir/$_name" build
    meson compile -C build
}

check() {
  meson test -C build --print-errorlogs
}

package() {
    meson install -C build --destdir "$pkgdir"
}
