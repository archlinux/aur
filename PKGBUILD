# Maintainer: JohnHolmesII <jedistephen@hotmail.com>

pkgname=hare-hook
pkgver=0.9.1
pkgrel=1
pkgdesc='A dreadfully simple socket listener that executes commands'
arch=(x86_64)
url=https://harehook.net
license=(Unlicense)
makedepends=(hare)
source=("$pkgname-v$pkgver.tar.gz::https://git.sr.ht/~johnholmesii/$pkgname/archive/v$pkgver.tar.gz"
        "$pkgname.service"
        "$pkgname.conf")

sha256sums=('deb59c7226ba177306a0b812a7c870336c070869c56dc84f43538e3d224ebd4a'
            'd5e89e2d5c89f74a812c23819f18aaaf8717007aa71372dd02e5da2a5a3982d0'
            'dc5104505375cec3093ec2c91b9e6704a709d45ca2dd1c51e98d95ef2eaf2961')

build() {
  cd "$pkgname-v$pkgver"

  LDFLAGS= hare build -R -o "$pkgname"
}

package() {
  install -Dm0755 -t "$pkgdir/usr/bin" "$pkgname-v$pkgver/$pkgname"
  install -Dm0644 ../"$pkgname.service" "$pkgdir/usr/lib/systemd/system/$pkgname.service"
  install -Dm0644 ../"$pkgname.conf" "$pkgdir/etc/$pkgname"
}
