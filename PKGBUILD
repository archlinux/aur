# Maintainer: HurricanePootis <hurricanepootis@protonmail.com>
pkgname=maretf-bin
pkgver=0.6.4
pkgrel=1
pkgdesc="A work in progress command-line utility to work with VTF files."
arch=('x86_64')
url="https://github.com/craftablescience/MareTF"
license=('MIT')
makedepends=('patchelf')
depends=('glibc' 'gcc-libs')
provides=("${pkgname::-4}")
conflicts=("${pkgname::-4}")
source=("MareTF-Linux-Standalone-gcc-release-${pkgver}.zip::$url/releases/download/v${pkgver}/MareTF-Linux-Standalone-gcc-release.zip"
	"$url/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('7043ea6f5130a863e4f08b7e5f3484e6f229652e75eb8d63437f2f584b281e17'
            '917c8ffeb11e2e604632dd9170aa2d002e9e9227ce84912ba459c60040346d90')
validpgpkeys=()

package() {
	cd "$srcdir"
	install -Dm755 "$srcdir/${pkgname::-4}" "$pkgdir/usr/bin/${pkgname::-4}"
	install -Dm644 "$srcdir/MareTF-${pkgver}/LICENSE" "$pkgdir/usr/share/licenses/${pkgname}/LICENSE"
	patchelf --remove-rpath "$pkgdir/usr/bin/${pkgname::-4}"
}
