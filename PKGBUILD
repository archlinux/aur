# Maintainer: Christopher Arndt <aur -at- chrisarndt -dot- de>

pkgname="master_me"
pkgver=1.1.0
pkgrel=2
pkgdesc='Automatic audio mastering plugin for live-streaming, podcasting and internet radio stations.'
arch=(x86_64)
url='https://github.com/trummerschlunk/master_me'
license=(GPL3)
depends=(gcc-libs glibc libxcursor libxrandr)
makedepends=(faustpp libglvnd)
groups=(lv2-plugins pro-audio vst-plugins vst3-plugins)
optdepends=('jack: stand-alone JACK application')
source=("https://github.com/trummerschlunk/$pkgname/releases/download/$pkgver/$pkgname-$pkgver.tar.xz")
sha256sums=('7414d0d08caeecdf68fc38d3b46b28335d90f30c1ab4734ebca28be4dafc3452')


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
