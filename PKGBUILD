# Maintainer:  Oliver Jaksch <arch-aur@com-in.de>

pkgname=kradio
pkgver=5.0.0_beta1
pkgrel=3
pkgdesc='Comfortable KDE Frameworks 5 internet and AM/FM radio application'
arch=('i686' 'x86_64')
url='http://kradio.sourceforge.net/'
license=('GPL2')
depends=('alsa-lib' 'ffmpeg' 'kdesignerplugin' 'libmms' 'libsndfile' 'plasma-framework' 'qt5-base')
optdepends=('lirc' 'lame' 'libvorbis')
makedepends=('cmake' 'boost' 'extra-cmake-modules')
replaces=('kradio' 'kradio-git')
conflicts=('kradio' 'kradio-git')
install="${pkgname}.install"
source=("https://downloads.sourceforge.net/project/kradio/kradio/${pkgver//_/-}/${pkgname}5-${pkgver//_/-}.tar.bz2")
sha512sums=('b40079d130ffbe47f4717b93d5c804f833f9219c4c6b0afdd44ae8a5b105c014f54b8f008b0a2962464e0080fa4724b842b7a7ba32504a09372d1bf5ab1ed9ec')

build() {
  cd "${srcdir}/${pkgname}5-${pkgver//_/-}"
  mkdir build
  cd build
  cmake -Wno-dev ".." \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_BUILD_TYPE=RELEASE
  make ${MAKEFLAGS}
}

package() {
  cd "${srcdir}/${pkgname}5-${pkgver//_/-}/build"
  make DESTDIR="${pkgdir}" install
}
