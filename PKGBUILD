# Contributor: Andrew Panchenko <panchenkoac at gmail>
# Contributor: ava1ar <mail(at)ava1ar(dot)me>
# Maintainer: Self Denial <selfdenial at pm dot me>

pkgname=qmmp-plugin-pack
pkgver=2.4.0
pkgrel=1
pkgdesc='Qmmp Plugin Pack'
arch=('x86_64')
url='http://qmmp.ylsoftware.com'
license=('GPL-1.0-or-later')
depends=("qmmp>=$pkgver" 'taglib>=1.12.0' 'qt6-base')
optdepends=('libmodplug>=0.8.4' 'libsamplerate>=0.1.2' 'ffmpeg>=3.4.0' 'yt-dlp')
makedepends=('cmake>=3.18.0' 'qt6-tools' 'taglib>=1.12.0' 'libmodplug>=0.8.4'
             'libsamplerate>=0.1.2' 'ffmpeg>=3.4.0' 'yt-dlp')
source=(https://qmmp.ylsoftware.com/files/qmmp-plugin-pack/${pkgver:0:3}/${pkgname}-${pkgver}.tar.bz2)
b2sums=('3886c9ff0b05dd554be9284e198eb7efc59ea907f2a3e8a75391877f3df4e8633cd277200954bef5b9a2fea79a176f1b2ad4207a6895622d197e4f7cbef22c3d')

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
