# Maintainer: Sven Greb <development@svengreb.de>
# Contributor: Arctic Ice Studio <development@arcticicestudio.com>
#
# This package is built according to the AUR Go packaging guidelines:
# https://wiki.archlinux.org/index.php/Go_package_guidelines
pkgname=goweight
pkgver=1.0.2
pkgrel=1
pkgdesc="A tool to analyze and troubleshoot a Go binary size"
arch=("x86_64")
url="https://github.com/jondot/goweight"
license=("MIT")
makedepends=("git" "go-pie")
source=("$pkgname-$pkgver.tar.gz::https://github.com/jondot/goweight/archive/v$pkgver.tar.gz")
sha256sums=("d82cc3eb4210e38425e67aa5beaf003c2bcef01107a981dc5540de973fbb46a6")

build() {
  cd "$pkgname-$pkgver" || exit 1

  go build \
    -trimpath
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
