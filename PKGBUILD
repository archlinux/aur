# Maintainer: Michael Lass <bevan@bi-co.net>
# Contributor: Viktor Drobot (aka dviktor) linux776 [at] gmail [dot] com

# This PKGBUILD is maintained on github:
# https://github.com/michaellass/AUR

pkgname=dream
pkgver=2.3_qt6
_gitrev=e01196f5aa00b57e2201a8950189798e65ca97fa
pkgrel=2
pkgdesc="Software radio for AM and Digital Radio Mondiale (DRM)"
arch=(i686 x86_64)
url="https://sourceforge.net/projects/drm"
license=(GPL-2.0-only)
depends=(alsa-lib fftw glibc gpsd hamlib libfdk-aac libgcc libsndfile libstdc++ qt6-base qwt speexdsp zlib)
source=("https://github.com/hpeter3/$pkgname/archive/$_gitrev.zip")
sha256sums=('b64c74b87590fe75901abd6ad31e95f2f8d093cdac004f6e6316d7be8171c156')

prepare() {
  cd "${srcdir}/${pkgname}-${_gitrev}"
  mkdir build
}

build() {
  cd "${srcdir}/${pkgname}-${_gitrev}"
  cmake -S . -B build -DUSE_QT=ON -DENABLE_SNDFILE=ON -DENABLE_SPEEXDSP=ON -DENABLE_ALSA=ON -DENABLE_QWT=ON -DENABLE_GPS=ON -DENABLE_FDK_AAC=ON -DENABLE_OPUS=ON -DENABLE_HAMLIB=ON -DCMAKE_BUILD_TYPE=Release -DQWT_LIB=/usr/lib/libqwt.so
  cmake --build build
}

package() {
  cd "${srcdir}/${pkgname}-${_gitrev}/build"
  make DESTDIR="${pkgdir}" install
}
