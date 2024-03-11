# Maintainer: Christopher Arndt <aur at chrisarndt dot de>

pkgname=guitarix.vst
pkgver=0.3
pkgrel=1
pkgdesc='A versatile (guitar) amplifier VST3 plugin'
arch=(x86_64)
url='https://github.com/brummer10/guitarix.vst'
license=(GPL-3.0-or-later)
groups=(vst3-plugins pro-audio)
depends=(
  gcc-libs
  glib2
  glibc
  glibmm
  graphite
  libsigc++
)
makedepends=(
  alsa-lib
  avahi
  boost
  curl
  eigen
  fftw
  freetype2
  gperf
  intltool
  lilv
  libsndfile
  sassc
  waf
  webkit2gtk
)
optdepends=(
  'vst3-host: for VST3 plugins'
  'gxplugins.lv2: for Guitarix LV2 plugins'
)
source=("https://github.com/brummer10/$pkgname/releases/download/v$pkgver/Guitarix.vst3_$pkgver.tar.gz")
sha256sums=('b1d93f5bc3991fe3253059879be9c7250ec71908afd273237fcea560962361eb')


build() {
  cd Guitarix.vst3_$pkgver
  make
}

package() {
  depends+=(
    libasound.so
    libavahi-client.so
    libavahi-common.so
    libavahi-glib.so
    libavahi-gobject.so
    libcurl.so
    libfftw3f.so
    libfreetype.so
    libgio-2.0.so
    libglib-2.0.so
    libglibmm-2.4.so
    libgobject-2.0.so
    liblilv-0.so
    libsigc-2.0.so
    libsndfile.so
  )
  cd Guitarix.vst3_$pkgver
  make JUCE_VST3DESTDIR="$pkgdir"/usr/lib/vst3 install
}
