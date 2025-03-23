# Maintainer: Adam Perkowski <adas1per@protonmail.com>
# https://github.com/adamperkowski/PKGBUILDs

_pkgname=oh-my-update
pkgname=omu
pkgver=0.1.8
pkgrel=1
pkgdesc="$_pkgname: oh-my-zsh plugin & theme updater"
arch=('x86_64')
url="https://github.com/utox39/$_pkgname"
license=('MIT')
source=("$_pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('51d59db3786a1b78e9e9ec2ea21a0dc0da86799e669b5f7023301ff7173f2ab0')
makedepends=('go')
depends=('glibc')

build() {
  cd "$_pkgname-$pkgver"
  export GOFLAGS='-buildmode=pie -trimpath -ldflags=-linkmode=external'
  go build "$pkgname.go"
}

check() {
  cd "$_pkgname-$pkgver"
  go test
}

package() {
  cd "$_pkgname-$pkgver"
  install -Dm0755 "$pkgname" -t "$pkgdir/usr/bin"
  install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"
  install -d "$pkgdir/usr/share/doc/$pkgname"
  cp ./*.md "$pkgdir/usr/share/doc/$pkgname"
}

# vim: ts=2 sw=2 et:
