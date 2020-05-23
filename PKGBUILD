# Maintainer: Daniel Bermond <dbermond@archlinux.org>

pkgname=avisynthplus
pkgver=3.6.0
pkgrel=1
pkgdesc='An improved version of the AviSynth frameserver'
arch=('x86_64')
url='https://github.com/AviSynth/AviSynthPlus/'
license=('GPL')
depends=('gcc-libs')
makedepends=('cmake' 'python-sphinx')
source=("${pkgname}-${pkgver}.tar.gz"::"https://github.com/AviSynth/AviSynthPlus/archive/v${pkgver}.tar.gz")
sha256sums=('48f4196e99a2583f6a7cbf71087f982bccc195ededa858ab9281bc029ef93c8d')

build() {
    cmake -B build -S "AviSynthPlus-${pkgver}" \
        -DCMAKE_BUILD_TYPE:STRING='None' \
        -DCMAKE_INSTALL_PREFIX:PATH='/usr' \
        -Wno-dev
    make -C build
    make -C "AviSynthPlus-${pkgver}/distrib/docs/english" man
}

package() {
    make -C build DESTDIR="$pkgdir" install
    install -D -m644 "AviSynthPlus-${pkgver}/distrib/docs/english/build/man/avisynth.1" -t "${pkgdir}/usr/share/man/man1"
}
