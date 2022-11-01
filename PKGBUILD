# Maintainer: OSAMC <https://github.com/osam-cologne/archlinux-proaudio>
# Contributor: Christopher Arndt <aur -at- chrisarndt -dot- de>

pkgname=mclk.lv2
pkgver=0.2.2
pkgrel=1
pkgdesc='A MIDI clock and realtime-message generator LV2 plugin'
arch=(x86_64 aarch64)
url='https://github.com/x42/mclk.lv2'
license=(GPL2)
groups=(lv2-plugins pro-audio)
depends=(glibc)
makedepends=(lv2)
checkdepends=(lv2lint)
source=("$pkgname-$pkgver.tar.gz::https://github.com/x42/$pkgname/archive/v$pkgver.tar.gz")
sha256sums=('a591aabfee91250c4f7342fdc8ce2a75c8a79ae96af524856e63cc02daa2f977')

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
