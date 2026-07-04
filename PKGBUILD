# Maintainer: Michael Lass <bevan@bi-co.net>
# Contributor: Viktor Drobot (aka dviktor) linux776 [at] gmail [dot] com

# This PKGBUILD is maintained on github:
# https://github.com/michaellass/AUR

pkgname=dream
pkgver=2.3_qt6
_gitrev=ecc5c4762327f5aa9282baf0cc90e4e428e72a04
pkgrel=3
pkgdesc="Software radio for AM and Digital Radio Mondiale (DRM)"
arch=(i686 x86_64)
url="https://sourceforge.net/projects/drm"
license=(GPL-2.0-only)
depends=(alsa-lib fftw glibc gpsd hamlib libfdk-aac libgcc libpcap libsndfile libstdc++ opus qt6-base qt6-webengine qwt speexdsp zlib)
source=("https://github.com/Drm-tools/$pkgname/archive/$_gitrev.zip")
sha256sums=('2cf329bfde20e2cdbaebcf81401018fcf11e544e6cb1e6caba8f3d8ed4fd1839')

build() {
  cd "${srcdir}/${pkgname}-${_gitrev}"
  cmake -S . -B build -DUSE_QT=ON -DENABLE_SNDFILE=ON -DENABLE_SPEEXDSP=ON -DENABLE_ALSA=ON -DENABLE_QWT=ON -DENABLE_GPS=ON -DENABLE_FDK_AAC=ON -DENABLE_OPUS=ON -DENABLE_HAMLIB=ON -DCMAKE_BUILD_TYPE=Release -DQWT_LIB=/usr/lib/libqwt.so
  cmake --build build
}

package() {
  cd "${srcdir}/${pkgname}-${_gitrev}/build"
  make DESTDIR="${pkgdir}" install
}
