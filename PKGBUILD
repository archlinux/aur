# Maintainer: Stephan Springer <buzo+arch@Lini.de>
# Contributor: Knut Ahlers <knut at ahlers dot me>

pkgname=librespeed-cli
_pkgname=speedtest-cli
pkgver=1.0.14
pkgrel=1
pkgdesc="Command line client for LibreSpeed"
arch=(x86_64 aarch64 armv6h armv7h)
url="https://github.com/librespeed/speedtest-cli"
license=(LGPL-3.0-only)
makedepends=(git go)
depends=(glibc)
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('3031e0f7babd7f9c51a1c49b95026d12532668455e8cc459049160f1bd525bf3')

build() {
    cd "$_pkgname-$pkgver"
    bash build.sh "$pkgver"
}

package() {
    cd "$_pkgname-$pkgver"
    install -Dm755 "out/$pkgname-$(go env GOOS)-$(go env GOARCH)" "$pkgdir/usr/bin/$pkgname"
    install -Dm644 -t "$pkgdir/usr/share/doc/$_pkgname" README.md
}
