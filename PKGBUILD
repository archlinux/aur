# Maintainer: Artemii Bigdan <reverse ni.nadgib@metra>
pkgname=fakecam
pkgver=0.0
pkgrel=1
epoch=
pkgdesc="A fake webcam provider to stream custom video"
arch=('i686' 'x86_64')
url=""
license=('MIT')
groups=()
depends=(
	'v4l2loopback-dkms'
	'gtk3'
	'grep'
	'sed'
	'coreutils'
	'polkit'
	'bash'
)
makedepends=(
	'go'
)
checkdepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=(
	"fakecam-cli.zip::https://github.com/UQuark0/fakecam-cli/archive/v$pkgver.zip"
	"fakecam-gui.zip::https://github.com/UQuark0/fakecam-gui/archive/v$pkgver.zip"	
)
noextract=()
sha256sums=(
	"682410da3ec34ac7d3415096f4deeb4620bd95c8dbc86c28bc1c80c419400833"
	"205612773dbde6197e32c417f3d008847c6b61f8b3e3436bff2d1ede14822c68"
)
validpgpkeys=()

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

	cd "fakecam-gui-$pkgver"
	go build
	cd ".."
}

package() {
	mkdir -p "$pkgdir/usr/bin"
	mv "fakecam-cli-$pkgver/fakecam-cli" "$pkgdir/usr/bin"
	mv "fakecam-gui-$pkgver/fakecam-gui" "$pkgdir/usr/bin"
}
