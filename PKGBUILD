# Maintainer: Christopher Arndt <aur -at- chrisarndt -dot- de>

pkgname="master_me"
pkgver=1.0.0
pkgrel=2
pkgdesc='Automatic audio mastering plugin for live-streaming, podcasting and internet radio stations.'
arch=(x86_64)
url='https://github.com/trummerschlunk/master_me'
license=(GPL3)
depends=(gcc-libs glibc libxcursor libxrandr)
makedepends=(faustpp libglvnd)
groups=(lv2-plugins pro-audio vst-plugins vst3-plugins)
optdepends=('jack: stand-alone JACK application')
source=("https://github.com/trummerschlunk/master_me/releases/download/1.0.0/master_me-1.0.0.tar.xz")
sha256sums=('97f3d640eadcdfee7946a40276f64620b1622235e8dc5f704617ccb599459bc6')


build() {
  cd $pkgname-$pkgver
  # plugin seems to perform slightly better with project's default compiler flags
  unset CXXFLAGS
  make VERBOSE=1 SKIP_NATIVE_AUDIO_FALLBACK=true
}

package() {
  depends+=(libGL.so)
  cd $pkgname-$pkgver
  make PREFIX=/usr DESTDIR="$pkgdir" install
}
