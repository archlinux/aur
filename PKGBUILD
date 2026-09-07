# Maintainer: Vo1dTear <vo1dtear.01@gmail.com>

pkgname=fooyin-plugin-midi-git
pkgver=r1.aef1c6c
pkgrel=1
pkgdesc='A MIDI input plugin for fooyin'
arch=('x86_64')
url='https://github.com/Vo1dTear/fooyin-plugin-midi'
license=('GPL-3.0-or-later')

depends=('fooyin' 'libspessasynth-git')
makedepends=('git' 'cmake')

source=("$pkgname::git+$url.git")
sha256sums=('SKIP')

pkgver() {
    cd "$srcdir/$pkgname"

    printf 'r%s.%s\n' \
        "$(git rev-list --count HEAD)" \
        "$(git rev-parse --short HEAD)"
}

build() {
    cmake -B build \
        -S "$srcdir/$pkgname" \
        -DCMAKE_BUILD_TYPE=Release \
        -DCMAKE_INSTALL_PREFIX=/usr

    cmake --build build
}

package() {
    DESTDIR="$pkgdir" cmake --install build
}
