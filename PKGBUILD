# Maintainer: Park Frazer <park@porkfreezer.com>

pkgname=riff-client
pkgver=26.10
pkgrel=1
pkgdesc="Native Spotify client for the GNOME desktop"
arch=('x86_64' 'armv7h' 'aarch64')
url="https://github.com/Diegovsky/riff"
license=('MIT')
depends=(gtk4 libadwaita alsa-lib libpulse)
makedepends=(meson ninja cmake blueprint-compiler rust git 'java-runtime-headless>=11')
options=(!lto)

source=("$pkgname::git+https://github.com/Diegovsky/riff.git#commit=8eb94626b7ba4cb814d034adc2a28e304a3d8b59")
noextract=()
sha256sums=("SKIP")
validpgpkeys=()

prepare() {
	cd "$srcdir/$pkgname"
}

build() {
	cd "$srcdir/$pkgname"
	./scripts/api/generate-spotify-api.sh
	./scripts/build.sh release --prefix /usr
}

check() {
	cd "$srcdir/$pkgname"

}

package() {
	cd "$srcdir/$pkgname"
	meson install -C target --destdir="$pkgdir/"
	install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
