# Maintainer: balaraz <balaraz@tuta.io>

pkgname=sof
pkgver=3.0
pkgrel=2
pkgdesc="Simple and fast calculate size of directories"
license=(GPL3)
url="https://codeberg.org/balaraz/sof"
arch=(x86_64)
depends=()
makedepends=(go gzip)
provides=(sof)
conflicts=()
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz")
sha256sums=("76d70fb84b29955e3593c1bdaeb88caa1afe62c233c9c87010ffef8b63d330c9")

package() {
		go build \
				--ldflags="-s -w" \
				-buildmode=pie \
				-trimpath \
				-o ${pkgdir}/usr/bin/${pkgname} \
				$pkgname/main.go
		gzip $pkgname/man/$pkgname.1
		install -Dm644 $pkgname/man/$pkgname.1.gz -t $pkgdir/usr/share/man/man1/
}
