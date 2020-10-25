# Maintainer: orhun <orhunparmaksiz@gmail.com>
# https://github.com/orhun/pkgbuilds

pkgname=imgcat
pkgdesc="Output images as RGB ANSI graphics on the terminal"
pkgver=1.0.2
pkgrel=1
arch=('x86_64')
url="https://github.com/trashhalo/imgcat"
license=('MIT')
makedepends=('go')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha512sums=('9b49778325f7c8ab69c51d9499f0e72036bc701a4067338855e4433f9ddcc9fcccb4d7b62e1cc3bdd652af2a382830410d9db90e1642b2aaf58eca93f272b7ea')

build() {
  cd "$pkgname-$pkgver"
  go get -d ./...
  go build \
    -gcflags "all=-trimpath=$PWD" \
    -asmflags "all=-trimpath=$PWD" \
    -ldflags "-extldflags $LDFLAGS" \
    -o "$pkgname" .
}

package() {
  cd "$pkgname-$pkgver"
  install -Dm 755 "$pkgname" -t "$pkgdir/usr/bin"
  install -Dm 644 README.md -t "$pkgdir/usr/share/doc/$pkgname"
  install -Dm 644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"
}
