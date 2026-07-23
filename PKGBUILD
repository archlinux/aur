# Maintainer: Park Frazer <park@porkfreezer.com>

pkgname=riff-client
pkgver=26.03
pkgrel=1
pkgdesc="Native Spotify client for the GNOME desktop"
arch=('x86_64' 'armv7h' 'aarch64')
url="https://github.com/Diegovsky/riff"
license=('MIT')
depends=(gtk4 libadwaita alsa-lib libpulse)
makedepends=(meson ninja cmake blueprint-compiler rust git)
options=(!lto)

source=("$pkgname::git+https://github.com/Diegovsky/riff.git#commit=ccfc77454ecd522bf110cedd08c683fc9fd7f3cb")
noextract=()
sha256sums=("SKIP")
validpgpkeys=()

prepare() {
	cd "$srcdir/$pkgname"
}

build() {
	cd "$srcdir/$pkgname"
	meson setup target -Dbuildtype=release -Doffline=false --prefix=/usr
	ninja -C target
}

check() {
	cd "$srcdir/$pkgname"
	
}

package() {
	cd "$srcdir/$pkgname"
	meson install -C target --destdir="$pkgdir/"
	install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
