# Maintainer: balaraz <balaraz@tuta.io>

pkgname=sof
pkgver=3.1
pkgrel=1
pkgdesc="Simple and fast calculate size of directories"
license=(GPL3)
url="https://codeberg.org/balaraz/sof"
arch=(x86_64)
depends=()
makedepends=(go gzip)
provides=(sof sof.1.gz)
conflicts=()
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz")
sha256sums=("7acc70d461d13b3c19ad2c066e2a0117831e309d55da893f8b7fcb79b42d63ae")

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
