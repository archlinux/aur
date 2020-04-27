# Maintainer: Adrien Smith <adrien at bouldersmiths dot com>
pkgname=overmind
pkgver=2.1.1
pkgrel=1
pkgdesc="Process manager for Procfile-based applications and tmux"
arch=("x86_64")
url="https://github.com/DarthSim/$pkgname"
license=("MIT")
depends=('tmux')
makedepends=("go-pie")
conflicts=("$pkgname-bin" "$pkgname-git")
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha512sums=('f3475dd03903605e92314f4ede61d70685185eb047fca6f57dbd371a5e625e348c06654ac0745337076cf0c258eafeaf6d37bd75e3bcc3070a2c78de823986c0')
b2sums=('73553af035fc676c3625061d8a1cb6dc300097ff000902350b0235b0ecf60edbfbb9e5ee0069664c586a111cb173b78f2a41637eb9fb212638c9ca695dfe0a9c')

build() {
  cd "$pkgname-$pkgver"
  go build \
    -gcflags "all=-trimpath=$PWD" \
    -asmflags "all=-trimpath=$PWD" \
    -ldflags "-s -w -extldflags $LDFLAGS" \
    -o $pkgname .
}

package() {
  cd "$pkgname-$pkgver"
  install -Dm755 $pkgname "$pkgdir/usr/bin/$pkgname"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
