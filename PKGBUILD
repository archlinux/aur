# Contributor: Andrew Panchenko <panchenkoac at gmail>
# Contributor: ava1ar <mail(at)ava1ar(dot)me>
# Maintainer: Self Denial <selfdenial at pm dot me>

pkgname=qmmp-plugin-pack
pkgver=2.3.0
pkgrel=2
pkgdesc='Qmmp Plugin Pack'
arch=('x86_64')
url='http://qmmp.ylsoftware.com'
license=('GPL-1.0-or-later')
depends=("qmmp>=$pkgver" 'taglib>=1.12.0' 'qt6-base')
optdepends=('libmodplug>=0.8.4' 'libsamplerate>=0.1.2' 'ffmpeg>=3.4.0' 'yt-dlp')
makedepends=('cmake>=3.18.0' 'qt6-tools' 'taglib>=1.12.0' 'libmodplug>=0.8.4'
             'libsamplerate>=0.1.2' 'ffmpeg>=3.4.0' 'yt-dlp')
source=(https://qmmp.ylsoftware.com/files/qmmp-plugin-pack/${pkgver:0:3}/${pkgname}-${pkgver}.tar.bz2)
b2sums=('3c6623aaf0e27dab485e517bebf557033083a30044fb13c3e37a524c6a407775304dd9f9a91107842f445f50dc59f88fc0a9b73e62fbcb6945da3ce880c534ba')

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
