# Maintainer: Stephan Springer <buzo+arch@Lini.de>
# Contributor: Knut Ahlers <knut at ahlers dot me>

pkgname=librespeed-cli
_pkgname=speedtest-cli
pkgver=1.0.15
pkgrel=1
pkgdesc="Command line client for LibreSpeed"
arch=(x86_64 aarch64 armv7h)
url="https://github.com/librespeed/speedtest-cli"
license=(LGPL-3.0-only)
makedepends=(git go)
depends=(glibc)
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('3f7af37e4b3190859fe9438ec35a53708ba40cfb03c4a3fc517d5d6284a97fbd')

build() {
    cd "$_pkgname-$pkgver"
    bash build.sh "$pkgver"
}

package() {
    cd "$_pkgname-$pkgver"
    install -Dm755 "out/$pkgname-$(go env GOOS)-$(go env GOARCH)" "$pkgdir/usr/bin/$pkgname"
    install -Dm644 -t "$pkgdir/usr/share/doc/$_pkgname" README.md
}
