# Maintainer: Daniel Bermond <dbermond@archlinux.org>

pkgname=libndi-git
pkgver=r38.g9302345
pkgrel=1
pkgdesc='Library to interact with Network Device Interface (NDI) streams (git version)'
arch=('x86_64')
url='https://code.videolan.org/jbk/libndi/'
license=('LGPL-2.1-or-later')
depends=(
    'glibc'
    'libmicrodns')
makedepends=(
    'git'
    'meson')
provides=('libndi')
conflicts=('libndi')
source=('git+https://code.videolan.org/jbk/libndi.git')
sha256sums=('SKIP')

pkgver() {
    printf 'r%s.g%s' "$(git -C libndi rev-list --count HEAD)" "$(git -C libndi rev-parse --short HEAD)"
}

build() {
    arch-meson build libndi -Dmicrodns='enabled'
    meson compile -C build
}

check() {
    meson test -C build --print-errorlogs
}

package() {
    meson install -C build --destdir "$pkgdir"
}
