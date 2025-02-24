# Maintainer: OSAMC <https://github.com/osam-cologne/archlinux-proaudio>
# Contributor: Christopher Arndt <aur -at- chrisarndt -dot- de>
# Contributor: Florian Hülsmann <fh@cbix.de>

pkgname=guitarix.vst
pkgver=0.4
pkgrel=2
pkgdesc='A versatile (guitar) amplifier VST3 plugin'
arch=(aarch64 x86_64)
url='https://github.com/brummer10/guitarix.vst'
license=(GPL-3.0-or-later)
groups=(vst3-plugins pro-audio)
provides=(lv2-host)
depends=(gcc-libs glibc)
makedepends=(boost curl fftw freetype2 glibmm lilv libsndfile libx11 libxcursor libxinerama libxrandr)
optdepends=('vst3-host: for VST3 plugins')
source=("https://github.com/brummer10/$pkgname/releases/download/v$pkgver/Guitarix.vst3_$pkgver.tar.gz")
sha256sums=('2fc71fb495695a5a98b4c2ee3997eb88803951d039e3231a9cffc721a212e402')

build() {
  cd Guitarix.vst3_$pkgver
  make
}

package() {
  depends+=(libcurl.so libfftw3f.so libfreetype.so libglib-2.0.so libgio-2.0.so libglibmm-2.4.so
    libgiomm-2.4.so libgobject-2.0.so liblilv-0.so libsigc-2.0.so libsndfile.so)
  cd Guitarix.vst3_$pkgver
  make JUCE_VST3DESTDIR="$pkgdir"/usr/lib/vst3 install
}
