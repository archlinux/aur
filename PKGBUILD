# Maintainer: Adam Wood <woodadam272 at gmail dot com>
pkgname=peel-git
_pkgname=${pkgname%-*}
pkgver=0.1.0r446.2659b44
pkgrel=1
pkgdesc="Modern C++ bindings for GObject-based libraries, including GTK and GStreamer"
arch=('x86_64')
url="https://gitlab.gnome.org/bugaevc/peel"
license=('MIT')
depends=('python')
makedepends=('meson' 'git' 'ninja')
provides=("peel=${pkgver}")
source=("git+$url.git")
sha256sums=('SKIP')

pkgver() {
  cd $_pkgname
  printf "0.1.0r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
    rm -rf aur_build
}

build() {
    meson setup --prefix=/usr --buildtype=plain aur_build $_pkgname
    meson compile -C aur_build
}

package() {
    meson install -C aur_build --destdir "$pkgdir"
}
