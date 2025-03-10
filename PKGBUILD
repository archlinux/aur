# Maintainer: tarball <bootctl@gmail.com>
# Contributor: Richard Steinmetz <steinmetz.richard@googlemail.com>

pkgname=certgen
pkgver=1.3.0
pkgrel=1
pkgdesc='A dead simple tool to generate self signed certificates'
arch=('i686' 'x86_64' 'aarch64' 'riscv64')
url="https://github.com/minio/$pkgname"
license=('BSD-3-Clause')
makedepends=('go')
source=("$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('976c41e68ea40c7cf3412568f492112075f11852d7753b3bfd20c9f31e75bf95')

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
