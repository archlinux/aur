# Maintainer: Jason Staten <code.aur@jxs.me>
pkgname="hxagent"
pkgver=1.0.2
pkgrel=1
pkgdesc="Hetrix Tools Server Monitor"
url="https://git.sr.ht/~statianzo/hxagent"
arch=("x86_64")
license=("GPL-3.0-only")
depends=("glibc")
makedepends=("go")
backup=('etc/conf.d/hxagent')
source=("hxagent-$pkgver.tar.gz::https://git.sr.ht/~statianzo/hxagent/archive/v${pkgver}.tar.gz"
  "hxagent.confd"
  "hxagent.service"
  "hxagent.sysusers"
)

prepare() {
  tar -xzf hxagent-$pkgver.tar.gz
}

build() {
  cd "$pkgname-v$pkgver"
  CGO_ENABLED=0 go build -ldflags "-X main.Version=${pkgver}" -o out/hxagent .
}

package() {
  install -Dm755 "$pkgname-v$pkgver/out/hxagent" -t "$pkgdir/usr/bin/"
  install -Dm644 "hxagent.service" -t "$pkgdir/usr/lib/systemd/system/"
  install -Dm644 "hxagent.confd" "$pkgdir/etc/conf.d/hxagent"
  install -Dm644 "hxagent.sysusers" "$pkgdir/usr/lib/sysusers.d/hxagent.conf"
}

sha256sums=('42fb90c3cf4f89c0fcab60348b273a0cff1ba74663a2b7718a5cfb396a3f6917'
  '585707c03aadb90b3c10ae5415a4d7bb80e37c72c55a30d7b6b5c798fb504ca4'
  '8b7088a1adf8c03f0063fc3b4ce702a01a605ef37dc7172d25173c9672b1cb32'
  'f9f43cfc7c5cc3021930c6d5d7444dbd738436a1f37d0b13a03ae3fca81f48e8')
