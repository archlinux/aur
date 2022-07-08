# Maintainer: OSAMC <https://github.com/osam-cologne/archlinux-proaudio>
# Contributor: Christopher Arndt <aur -at- chrisarndt -dot- de>

pkgname=mclk.lv2
pkgver=0.2.1
pkgrel=3
pkgdesc='A MIDI clock and realtime-message generator LV2 plugin'
arch=(x86_64 aarch64)
url='https://github.com/x42/mclk.lv2'
license=(GPL2)
groups=(lv2-plugins pro-audio)
depends=(glibc)
makedepends=(lv2)
checkdepends=(lv2lint)
source=("$pkgname-$pkgver.tar.gz::https://github.com/x42/$pkgname/archive/v$pkgver.tar.gz")
sha256sums=('5a0795a76ce65adc1ffa6eb62db8f9bdef28e6c4966ba4877bd00ff5d3bd6965')

build() {
  cd $pkgname-$pkgver
  make
}

check() {
  cd $pkgname-$pkgver
  lv2lint -Mpack -I build "http://gareus.org/oss/lv2/mclk"
}

package() {
  cd $pkgname-$pkgver
  make PREFIX=/usr DESTDIR="$pkgdir/" install
}
