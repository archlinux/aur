# Contributor: Andrew Panchenko <panchenkoac at gmail>
# Contributor: ava1ar <mail(at)ava1ar(dot)me>
# Maintainer: Self Denial <selfdenial at pm dot me>

pkgname=qmmp-plugin-pack
pkgver=2.2.2
pkgrel=1
pkgdesc='Qmmp Plugin Pack'
arch=('x86_64')
url='http://qmmp.ylsoftware.com'
license=('GPL-1.0-or-later')
depends=("qmmp>=$pkgver" 'taglib>=1.12.0' 'qt6-base')
optdepends=('libmodplug>=0.8.4' 'libsamplerate>=0.1.2' 'ffmpeg>=3.4.0' 'yt-dlp')
makedepends=('cmake>=3.18.0' 'qt6-tools' 'taglib>=1.12.0' 'libmodplug>=0.8.4'
             'libsamplerate>=0.1.2' 'ffmpeg>=3.4.0' 'yt-dlp')
source=(https://qmmp.ylsoftware.com/files/qmmp-plugin-pack/${pkgver#*.}/${pkgname}-${pkgver}.tar.bz2)
b2sums=('a1a1263b7a1626639864c621ce21f426c2f42b9f1cc463997f712762d0cf7a13388325111142e62341d55a5f5608ab788b8973e56dae3cd88a9fd39434370a25')

build() {
    local cmake_options=(
         -G 'Unix Makefiles'
         -B "${srcdir}/${pkgname}-${pkgver}/build"
         -S "${srcdir}/${pkgname}-${pkgver}"
         -DCMAKE_INSTALL_PREFIX='/usr'
         -DCMAKE_INSTALL_LIBDIR='/usr/lib'
         -DCMAKE_BUILD_TYPE='None'
         -Wno-dev
    )

    cmake "${cmake_options[@]}"
    cd "${srcdir}/${pkgname}-${pkgver}/build"
    make
}

package() {
    cd "${srcdir}/${pkgname}-${pkgver}/build"
    make DESTDIR="${pkgdir}" install
}
