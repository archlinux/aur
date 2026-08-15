# Maintainer: Daniel Bermond <dbermond@archlinux.org>

pkgname=libnoidea-git
pkgver=r42.g5f1bcc1
pkgrel=1
pkgdesc='Library to interact with Network Device Interface (NDI) streams (git version)'
arch=('x86_64')
url='https://code.videolan.org/videolan/libnoidea/'
license=('LGPL-2.1-or-later')
depends=(
    'glibc'
    'libmicrodns')
makedepends=(
    'git'
    'meson')
provides=('libnoidea' 'libndi-git')
conflicts=('libnoidea' 'libndi-git')
replaces=('libndi-git')
source=('git+https://code.videolan.org/videolan/libnoidea.git')
sha256sums=('SKIP')

pkgver() {
    printf 'r%s.g%s' "$(git -C libnoidea rev-list --count HEAD)" "$(git -C libnoidea rev-parse --short HEAD)"
}

build() {
    arch-meson build libnoidea -Dmicrodns='enabled'
    meson compile -C build
}

check() {
    meson test -C build --print-errorlogs
}

package() {
    meson install -C build --destdir "$pkgdir"
}
