# Maintainer: Radosław Kintzi <r.kintzi@gobytes.dev>
pkgname=statusbar
pkgver=0.5.3
pkgrel=2
pkgdesc='A feature complete, customizable and extendable swaybar/i3bar content generator'
arch=('x86_64')
url="https://gobytes.dev/$pkgname"
license=('Apache 2.0')
depends=('libpulse.so')
makedepends=('go' 'scdoc')
source=("https://git.sr.ht/~rkintzi/$pkgname/archive/v$pkgver.tar.gz")
sha256sums=('b7d427f366ec992b53d2c1b8d8c9ae62c4f0bf13450b59ed18c12b40825b6acc')

prepare(){
  cd "$pkgname-v$pkgver"
  mkdir -p build/
}

build() {
  cd "$pkgname-v$pkgver"
  make
}

check() {
  cd "$pkgname-v$pkgver"
  go test ./...
}

package() {
  cd "$pkgname-v$pkgver"
  DESTDIR=${pkgdir} PREFIX=/usr make install
  install -d ${pkgdir}/usr/share/statusbar
  install README.md ${pkgdir}/usr/share/statusbar
}
