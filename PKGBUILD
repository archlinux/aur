# This is an example PKGBUILD file. Use this as a start to creating your own,
# and remove these comments. For more information, see 'man PKGBUILD'.
# NOTE: Please fill out the license field for your package! If it is unknown,
# then please put 'unknown'.

# Maintainer: Your Name <youremail@domain.com>
pkgname=gcode-thumb
pkgver=0.1.0
pkgrel=1
epoch=
pkgdesc="A thumbnail generator for gcode files"
arch=("x86_64" "aarch64")
url="https://github.com/gyscos/gcode-thumb"
license=('MIT')
groups=()
depends=()
makedepends=("rust" "cargo")
checkdepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=("https://github.com/gyscos/gcode-thumb/archive/refs/tags/v$pkgver.tar.gz")
noextract=()
sha256sums=('625664c3811a80e66e4d2f4282e3ec10526cf8a7a01a3fb0317b1f791340e813')
validpgpkeys=()

prepare() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
	cd "${srcdir}/${pkgname}-${pkgver}"
	cargo build --release --offline
}

package() {
	cd "${srcdir}/${pkgname}-${pkgver}"

        install -D -m755 target/release/gcode-thumb $pkgdir/usr/bin/gcode-thumb
        install -D -m644 gcode.thumbnailer $pkgdir/usr/share/thumbnailers/gcode.thumbnailer
        install -D -m644 LICENSE $pkgdir/usr/share/licenses/${pkgname}/LICENSE
}

