# Maintainer: Carlo Teubner <carlo@cteubner.net>

pkgname=archupd
pkgver=0.1.0
pkgrel=1
pkgdesc='Arch updater'
arch=('x86_64')
url="https://github.com/c4rlo/archupd"
license=('MIT')
depends=('glibc')
makedepends=('go')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('b5073a30273518c8cab09e8d2e10b96e412641aeb3b7e2028c82994b9e85d5ea')

build() {
  cd "$pkgname-$pkgver"
  go build -buildmode=pie -trimpath -ldflags "-linkmode external -extldflags '$LDFLAGS'"
}

package() {
  cd "$pkgname-$pkgver"
  install -D "$pkgname" "$pkgdir/usr/bin/$pkgname"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
