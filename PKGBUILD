# Maintainer: Artemii Bigdan <reverse ni.nadgib@metra>
pkgname=fakecam-gui
pkgver=0.0
pkgrel=1
pkgdesc="A fake webcam provider to stream custom video (GUI)"
arch=('i686' 'x86_64')
license=('MIT')
groups=()
depends=(
	'v4l2loopback-dkms'
	'gtk3'
	'polkit'
	'ffmpeg'
)
makedepends=(
	'go'
)
source=(
	"fakecam-gui-v$pkgver.zip::https://github.com/UQuark0/fakecam-gui/archive/v$pkgver.zip"	
)
sha256sums=(
	"205612773dbde6197e32c417f3d008847c6b61f8b3e3436bff2d1ede14822c68"
)

build() {
	cd "$srcdir"

	export CGO_CPPFLAGS="${CPPFLAGS}"
	export CGO_CFLAGS="${CFLAGS}"
	export CGO_CXXFLAGS="${CXXFLAGS}"
	export CGO_LDFLAGS="${LDFLAGS}"
	export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw -v"

	cd "fakecam-gui-$pkgver"
	go build
	cd ".."
}

package() {
	mkdir -p "$pkgdir/usr/bin"
	mv "fakecam-gui-$pkgver/fakecam-gui" "$pkgdir/usr/bin"

	mkdir -p "$pkgdir/usr/share/licenses/$pkgname"
	mv "fakecam-gui-$pkgver/LICENSE.md" "$pkgdir/usr/share/licenses/$pkgname/"
}
