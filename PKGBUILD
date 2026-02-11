# Maintainer: HurricanePootis <hurricanepootis@protonmail.com>
pkgname=vtf-thumbnailer-bin
pkgver=1.1.1
pkgrel=1
pkgdesc="Adds previews for VTF files in your file explorer of choice on Windows and Linux."
arch=('x86_64')
url="https://github.com/craftablescience/vtf-thumbnailer"
license=('MIT')
depends=('glibc' 'gcc-libs')
provides=(${pkgname::-4})
conflicts=(${pkgname::-4})
source=("$url/releases/download/v${pkgver}/VTF-Thumbnailer-${pkgver}-Linux.deb")
sha256sums=('5f0d08f97c8fb37106f775e0273ebaf987d17d0f26fd399130f1fa01c0b3ca4b')
validpgpkeys=()

prepare() {
	cd "$srcdir"
	bsdtar xf data.tar.zst
}

package() {
	cd "$srcdir"
	install -Dm755 "$srcdir/opt/${pkgname::-4}/${pkgname::-4}" "$pkgdir/usr/lib/${pkgname::-4}/${pkgname::-4}"
	install -Dm644 "$srcdir/usr/share/mime/packages/${pkgname::-4}.xml" "$pkgdir/usr/share/mime/packages/${pkgname::-4}.xml"
	install -Dm644 "$srcdir/usr/share/thumbnailers/${pkgname::-4}.thumbnailer" "$pkgdir/usr/share/thumbnailers/${pkgname::-4}.thumbnailer"
	sed -i 's/\/opt/\/usr\/lib/g' "$pkgdir/usr/share/thumbnailers/${pkgname::-4}.thumbnailer"
}
