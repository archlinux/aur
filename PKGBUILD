# Maintainer: HurricanePootis <hurricanepootis@protonmail.com>
pkgname=maretf-bin
pkgver=0.12.1
pkgrel=1
pkgdesc="A work in progress command-line utility to work with VTF files."
arch=('x86_64')
url="https://github.com/craftablescience/MareTF"
license=('MIT')
makedepends=('patchelf')
depends=('glibc' 'libstdc++' 'libgcc' 'qt6-base' 'hicolor-icon-theme' 'libglvnd')
replaces=("vtf-thumbnailer")
provides=("${pkgname::-4}")
conflicts=("${pkgname::-4}" "vtf-thumbnailer")
source=("MareTF-Linux-x86_64-${pkgver}.tar.zst::$url/releases/download/v${pkgver}/MareTF-Linux-x86_64.tar.zst")
sha256sums=('103a317781df34e3bc089a33f032ae08fa88f35b7ac81dec81bb2d53c2171e1e')

package() {
	cd "$srcdir"
	install -Dm755 "$srcdir/MareTF-${pkgver}-Linux/${pkgname::-4}" "$pkgdir/usr/bin/${pkgname::-4}"
	install -Dm755 "$srcdir/MareTF-${pkgver}-Linux/${pkgname::-4}_gui" "$pkgdir/usr/bin/${pkgname::-4}_gui"
	install -Dm755 "$srcdir/MareTF-${pkgver}-Linux/${pkgname::-4}_thumbnailer" "$pkgdir/usr/bin/${pkgname::-4}_thumbnailer"
	cp -a "${srcdir}/MareTF-${pkgver}-Linux/share" "${pkgdir}/usr/share/"
	mv "${pkgdir}/usr/share/licenses/${pkgname::-4}" "${pkgdir}/usr/share/licenses/${pkgname}"
	patchelf --remove-rpath "$pkgdir/usr/bin/${pkgname::-4}"
	patchelf --remove-rpath "$pkgdir/usr/bin/${pkgname::-4}_gui"
	patchelf --remove-rpath "$pkgdir/usr/bin/${pkgname::-4}_thumbnailer"
}
