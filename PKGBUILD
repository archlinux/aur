# Maintainer: dvb <archlinux at b0rken dot de>
# Contributor: Emanuele 'Lele aka eldios' Calo' <lele@sshadm.in>

pkgname=trufflehog
pkgver=3.83.0
pkgrel=1
pkgdesc="Tool for finding secrets like private keys and credentials."
arch=('x86_64')
url="https://github.com/trufflesecurity/trufflehog"
license=('AGPL3')
depends=('glibc')
makedepends=('go')
provides=('trufflehog')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha512sums=('28cec36634b9e58e0c240ec37732220a670a0dc53f0922fcf1d8b35838e3c37ca5d10a8cf39fc827dc155296cb9790e0f640a36331cca2a5fda3102e750368c1')

build() {
  cd "$pkgname-$pkgver"
  GOPATH="$srcdir/build" go build -buildmode=pie -ldflags "-linkmode=external -extldflags \"$LDFLAGS\"" -modcacherw -trimpath
}

package() {
  install -Dm755 "$pkgname-$pkgver/$pkgname" "$pkgdir/usr/bin/$pkgname"
}
