# Maintainer : Daniel Bermond <dbermond@archlinux.org>
# Contributor: Jesse Jaara <gmail.com: jesse.jaara>
# Contributor: Det <gmail.com: nimetonmaili>
# Contributor: h31 <yandex.com: h31mail>
# Contributor: julroy67 <gmail.com: julroy67>

pkgname=libvpx-git
pkgver=1.10.0.r15.gd55cab425d
pkgrel=1
pkgdesc='VP8 and VP9 video codecs (git version)'
arch=('x86_64')
url='https://www.webmproject.org/'
license=('BSD')
depends=('gcc-libs')
makedepends=('git' 'nasm')
provides=('libvpx' 'libvpx.so')
conflicts=('libvpx')
source=('git+https://chromium.googlesource.com/webm/libvpx') # official repo
#source=('git+https://github.com/webmproject/libvpx.git') # mirror
sha256sums=('SKIP')

pkgver() {
    cd libvpx
    git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g;s/^v//;s/\.\(RC\|rc\)/rc/'
}

build() {
    cd libvpx
    ./configure \
        --prefix='/usr' \
        --disable-install-docs \
        --disable-install-srcs \
        --enable-pic \
        --enable-postproc \
        --enable-runtime-cpu-detect \
        --enable-shared \
        --enable-vp8 \
        --enable-vp9 \
        --enable-vp9-highbitdepth \
        --enable-vp9-temporal-denoising
    make
}

package() {
    make -C libvpx DESTDIR="$pkgdir" install
    install -D -m644 libvpx/{LICENSE,PATENTS} -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
