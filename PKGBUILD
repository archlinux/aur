# Maintainer: HurricanePootis <hurricanepootis@protonmail.com>
pkgname=maretf-bin
pkgver=0.6.1
pkgrel=1
pkgdesc="A work in progress command-line utility to work with VTF files."
arch=('x86_64')
url="https://github.com/craftablescience/MareTF"
license=('MIT')
makedepends=('patchelf')
depends=('glibc' 'gcc-libs')
provides=("${pkgname::-4}")
conflicts=("${pkgname::-4}")
source=("$url/releases/download/v${pkgver}/MareTF-Linux-Standalone-gcc-release.zip"
	"$url/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('7c499dc213244bd4a1837c57f7c900e3def405f0fa79625b6d6102878f4dbb32'
            'ea45d88c1d4ef5c971595e5a380858b7172cc1c40e6f130bc3624e72df8ab380')
validpgpkeys=()

package() {
	cd "$srcdir"
	install -Dm755 "$srcdir/${pkgname::-4}" "$pkgdir/usr/bin/${pkgname::-4}"
	install -Dm644 "$srcdir/MareTF-${pkgver}/LICENSE" "$pkgdir/usr/share/licenses/${pkgname}/LICENSE"
	patchelf --remove-rpath "$pkgdir/usr/bin/${pkgname::-4}"
}
