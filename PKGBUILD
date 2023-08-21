# Maintainer: dvb <archlinux at b0rken dot de>

pkgname=cookiemonster
pkgver=1.4.0
pkgrel=1
pkgdesc="Tool for decoding and modifying vulnerable session cookies from several different frameworks."
arch=('x86_64')
url="https://github.com/iangcarroll/cookiemonster/"
license=('MIT')
depends=('glibc')
makedepends=('go')
provides=('cookiemonster')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha512sums=('440502b16d8a5d92379121fca85d8a598f30bd5ef8bf950433c0b51cc890ad03e1c4ceb55466ae48741c880c371d6578b1695fb56c7c9fe3dfa43864b72201c6')

build() {
  cd "$pkgname-$pkgver/cmd/$pkgname"
  GOPATH="$srcdir/$pkgname-$pkgver/cmd/$pkgname" go build -buildmode=pie -ldflags "-linkmode=external -extldflags=$LDFLAGS" -modcacherw -trimpath
}

package() {
  install -Dm644 "$pkgname-$pkgver/LICENSE.md" "$pkgdir/usr/share/licenses/$pkgname/LICENSE.md"
  install -Dm755 "$pkgname-$pkgver/cmd/$pkgname/$pkgname" "$pkgdir/usr/bin/$pkgname"
}
