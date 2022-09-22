# Maintainer: scrouthtv <scrouthtv 0x40 gmail 0x2e com>
pkgname=gig
pkgver=0.8.3
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
sha512sums=("aabe00ed0e3d599d363c57d46e07cdfb325d657925916d2e116f03e4964136ecb059ea872979035c7ba53fc26257885c9201f95e144065202600acfaec337846")

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
