# Maintainer: Emmanuel Gil Peyrot <linkmauve@linkmauve.fr>

pkgname=dav1d-git
pkgver=0.8.1.r62.g9732c70
pkgrel=1
license=('BSD')
pkgdesc='AV1 cross-platform Decoder, focused on speed and correctness'
url='https://code.videolan.org/videolan/dav1d'
arch=('x86_64' 'armv7h' 'aarch64')
provides=('dav1d' 'libdav1d.so')
conflicts=('dav1d')
makedepends=('meson' 'ninja' 'git' 'nasm' 'xxhash' 'sdl2' 'libplacebo-git')
optdepends=('sdl2: for the dav1dplay example'
            'libplacebo-git: for the dav1dplay example')
source=('git+https://code.videolan.org/videolan/dav1d.git')
sha256sums=('SKIP')

pkgver() {
    cd dav1d
    git describe --long | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
    cd dav1d
    arch-meson build -Denable_examples=true
    ninja -C build
}

package() {
    cd dav1d
    DESTDIR="${pkgdir}" ninja -C build install
    install -Dm644 COPYING "${pkgdir}"/usr/share/licenses/${pkgname}/COPYING
}
