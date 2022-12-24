# Maintainer: JohnHolmesII <jedistephen@hotmail.com>

pkgname=hare-hook
pkgver=0.9.0
pkgrel=1
pkgdesc='A dreadfully simple socket listener that executes commands'
arch=(x86_64)
url=https://harehook.net
license=(Unlicense)
makedepends=(hare)
source=("$pkgname-v$pkgver.tar.gz::https://git.sr.ht/~johnholmesii/$pkgname/archive/v$pkgver.tar.gz"
        "$pkgname.service"
        "$pkgname.conf")

sha256sums=('acb4a53d3f2da9ae637802e2578748d2b99da03849aa77356435684442ca8542'
            'd5e89e2d5c89f74a812c23819f18aaaf8717007aa71372dd02e5da2a5a3982d0'
            'dc5104505375cec3093ec2c91b9e6704a709d45ca2dd1c51e98d95ef2eaf2961')

build() {
  cd "$pkgname-v$pkgver"

  LDFLAGS= hare build -o "$pkgname" main.ha
}

package() {
  install -Dm0755 -t "$pkgdir/usr/bin" "$pkgname-v$pkgver/$pkgname"
  install -Dm0644 ../"$pkgname.service" "$pkgdir/usr/lib/systemd/system/$pkgname.service"
  install -Dm0644 ../"$pkgname.conf" "$pkgdir/etc/$pkgname"
}
