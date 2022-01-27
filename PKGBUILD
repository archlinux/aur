# Maintainer: Carlo Teubner <carlo@cteubner.net>

pkgname=archupd
pkgver=0.2.0
pkgrel=1
pkgdesc='Arch updater'
arch=('x86_64')
url="https://github.com/c4rlo/archupd"
license=('MIT')
depends=('glibc')
makedepends=('go')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('5217e8dead462f3ec57bf62b21c7cff7a017ffc4730dbfc8f6db9028f197ca10')

build() {
  cd "$pkgname-$pkgver"
  go build -buildmode=pie -trimpath -ldflags "-linkmode external -extldflags '$LDFLAGS'"
}

package() {
  cd "$pkgname-$pkgver"
  install -D "$pkgname" "$pkgdir/usr/bin/$pkgname"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 archupd.1 "$pkgdir/usr/share/man/man1/archupd.1"
}
