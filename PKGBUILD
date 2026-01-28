# Maintainer: tarball <bootctl@gmail.com>
# Contributor: Richard Steinmetz <steinmetz.richard@googlemail.com>

pkgname=certgen
pkgver=1.4.0
pkgrel=1
pkgdesc='A dead simple tool to generate self signed certificates'
arch=('i686' 'x86_64' 'aarch64' 'riscv64')
url="https://github.com/minio/$pkgname"
license=('BSD-3-Clause')
makedepends=('go')
source=("$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('b8465a146d55da55fbe349adfb7939d69acbdf0a9a63062f587b63d687f6ab54')

build() {
  cd "$pkgname-$pkgver"
  go build \
    -trimpath \
    -buildmode=pie \
    -mod=readonly \
    -modcacherw \
    -ldflags "-linkmode external -extldflags '${LDFLAGS}'" \
    -o "build/$pkgname" \
    .
}

package() {
  cd "$pkgname-$pkgver"
  install -Dm755 "build/$pkgname" -t "$pkgdir/usr/bin/"
  install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
}
