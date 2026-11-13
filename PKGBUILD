# Maintainer: lemonxah <lemonxah@gmail.com>
pkgname=zestins
pkgver=1.2.7
pkgrel=1
pkgdesc="LV2 plugins from ZestBay: utility, meter, EQ, gate, compressor, delay, reverb, tone generator, synth and MIDI tools"
arch=('x86_64')
url="https://github.com/lemonxah/zestbay"
license=('MIT')
groups=('lv2-plugins' 'pro-audio')
depends=('glibc' 'libx11')
makedepends=('lv2' 'pkgconf')
optdepends=('zestbay: PipeWire patchbay that hosts these plugins')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('74501a2556b80241cdf4d8961bc745997ef7e9251c47bec3a7bef03252183cd2')

build() {
  cd "zestbay-$pkgver/zestins"
  make
}

package() {
  cd "zestbay-$pkgver/zestins"
  make install DESTDIR="$pkgdir" LV2_DIR=/usr/lib/lv2
  install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
  install -Dm644 ../LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
