# Maintainer: Carlo Teubner <carlo@cteubner.net>

pkgname=archupd
pkgver=0.2.1
pkgrel=1
pkgdesc='Arch updater'
arch=('x86_64')
url="https://github.com/c4rlo/archupd"
license=('MIT')
depends=('glibc')
makedepends=('go')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('38048e3f3cb8be5103d7a1f711f077cc0fa7b8ef2a3f9ee3d8309d71bee7aa95')

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
