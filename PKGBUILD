# Maintainer: Sven Greb <development@svengreb.de>
# Contributor: Arctic Ice Studio <development@arcticicestudio.com>
#
# This package is built according to the AUR Go packaging guidelines:
# https://wiki.archlinux.org/index.php/Go_package_guidelines
pkgname=goweight
pkgver=1.0.5
pkgrel=1
pkgdesc="A tool to analyze and troubleshoot a Go binary size"
arch=("x86_64")
url="https://github.com/jondot/goweight"
license=("MIT")
makedepends=("git" "go-pie")
source=("$pkgname-$pkgver.tar.gz::https://github.com/jondot/goweight/archive/v$pkgver.tar.gz")
sha256sums=('42b9ed74053d3c84bce2226744a8d93981dc1eaa60e6372346d2ba4df5a5dfca')

build() {
  cd "$pkgname-$pkgver" || exit 1

  go build \
    -trimpath \
    -buildmode=pie \
    -mod=readonly \
    -modcacherw \
    -ldflags "-extldflags \"${LDFLAGS}\"" \
    -o build/"$pkgname" .
}

package() {
  cd "$pkgname-$pkgver" || exit 1
  install -Dm755 build/"$pkgname" "$pkgdir"/usr/bin/"$pkgname"
  install -Dm644 LICENSE.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE.txt"
}
