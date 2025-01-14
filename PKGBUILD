# Contributor: Andrew Panchenko <panchenkoac at gmail>
# Contributor: ava1ar <mail(at)ava1ar(dot)me>
# Maintainer: Self Denial <selfdenial@pm.me>

pkgname=qmmp-plugin-pack
pkgver=2.2.1
pkgrel=1
pkgdesc='Qmmp Plugin Pack'
arch=('i686' 'x86_64')
url='http://qmmp.ylsoftware.com'
license=('GPL-1.0-or-later')
depends=("qmmp>=$pkgver" 'taglib>=1.12.0' 'mpg123>=1.13.0' 'libxmp>=4.2.0' 'qt6-base')
optdepends=('libmodplug>=0.8.4' 'libsamplerate>=0.1.2' 'ffmpeg>=3.4.0' 'yt-dlp')
makedepends=('cmake>=3.18' 'yasm' 'qt6-tools')
source=(https://qmmp.ylsoftware.com/files/qmmp-plugin-pack/2.2/${pkgname}-${pkgver}.tar.bz2)
b2sums=('ab22d0a5e76959ce02d7a845929ea768d460e1deee80dc9195fc8112a5b39ad73fb4faf65aac5bd50a33de2271861ee4a94bea80febd96ed73b368596c5bdcc2')

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
