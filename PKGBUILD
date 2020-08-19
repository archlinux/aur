# Maintainer: Artemii Bigdan <reverse ni.nadgib@metra>
pkgname=fakecam-cli
pkgver=0.0
pkgrel=1
pkgdesc="A fake webcam provider to stream custom video (CLI)"
arch=('i686' 'x86_64')
license=('MIT')
groups=()
depends=(
	'v4l2loopback-dkms'
)
makedepends=(
	'go'
)
source=(
	"fakecam-cli-v$pkgver.zip::https://github.com/UQuark0/fakecam-cli/archive/v$pkgver.zip"
)
sha256sums=(
	"682410da3ec34ac7d3415096f4deeb4620bd95c8dbc86c28bc1c80c419400833"
)

build() {
	cd "$srcdir"

	export CGO_CPPFLAGS="${CPPFLAGS}"
	export CGO_CFLAGS="${CFLAGS}"
	export CGO_CXXFLAGS="${CXXFLAGS}"
	export CGO_LDFLAGS="${LDFLAGS}"
	export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw -v"

	cd "fakecam-cli-$pkgver"
	go build
	cd ".."
}

package() {
	mkdir -p "$pkgdir/usr/bin"
	mv "fakecam-cli-$pkgver/fakecam-cli" "$pkgdir/usr/bin"

	mkdir -p "$pkgdir/usr/share/licenses/$pkgname"
	mv "fakecam-cli-$pkgver/LICENSE.md" "$pkgdir/usr/share/licenses/$pkgname/"
}
