# Maintainer: scrouthtv <scrouthtv 0x40 gmail 0x2e com>
pkgname=gig
pkgver=0.8.0
pkgrel=2
pkgdesc="Generate .gitignore files from your terminal (mostly) offline!"
license=('MIT')
url="https://github.com/shihanng/gig"
arch=('i686' 'x86_64' 'armv6h' 'armv7h')
depends=('glibc')
makedepends=('go')
optdepends=()
conflicts=()
source=("gig.tar.gz::https://github.com/shihanng/gig/archive/refs/tags/v$pkgver.tar.gz")
sha512sums=("697758901ae545fbda4a978a42c282e5fcc7fa8387584198f5b7ed5a01aec64846a66f3dc8f0e970fa1d59236d5ab72ff7d846021ca3a33471a7070a04fcfa94")

build() {
  cd "gig-$pkgver"

	export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"
	export CGO_ENABLED=0

  go build .
}

package() {
	cd "gig-$pkgver"

	# binary:
  install -Dm755 "gig" "$pkgdir/usr/bin/gig"
}
