# Maintainer: OSAMC <https://github.com/osam-cologne/archlinux-proaudio>
# Contributor: Christopher Arndt <aur -at- chrisarndt -dot- de>
# Contributor: Florian Hülsmann <fh@cbix.de>

pkgname=guitarix.vst
pkgver=0.5
pkgrel=1
pkgdesc='A versatile (guitar) amplifier VST3 plugin'
arch=(aarch64 x86_64)
url='https://github.com/brummer10/guitarix.vst'
license=(GPL-3.0-or-later)
groups=(vst3-plugins pro-audio)
provides=(lv2-host)
depends=(gcc-libs glibc glibmm)
makedepends=(boost curl fftw freetype2 lilv libsndfile libx11 libxcursor libxinerama libxrandr)
optdepends=('vst3-host: for VST3 plugins')
source=("https://github.com/brummer10/$pkgname/releases/download/v$pkgver/Guitarix.vst3_$pkgver.tar.gz")
sha256sums=('7b67521e9c2358df74e1876d76405c9a81820d5511046b9bd0a2b0d9bbaab823')

build() {
  cd Guitarix.vst3_$pkgver
  make
}

package() {
  depends+=(libcurl.so libfftw3f.so libfreetype.so libglib-2.0.so libgio-2.0.so libgobject-2.0.so
    liblilv-0.so libsigc-2.0.so libsndfile.so)
  cd Guitarix.vst3_$pkgver
  make JUCE_VST3DESTDIR="$pkgdir"/usr/lib/vst3 install
}
