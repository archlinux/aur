# Maintainer: HurricanePootis <hurricanepootis@protonmail.com>
pkgname=maretf-bin
pkgver=0.12.2
pkgrel=2
pkgdesc="A work in progress command-line utility to work with VTF files."
arch=('x86_64')
url="https://github.com/craftablescience/MareTF"
license=('MIT')
makedepends=('patchelf')
depends=('glibc' 'libstdc++' 'libgcc' 'qt6-base' 'hicolor-icon-theme' 'libglvnd'
	 'pango' 'at-spi2-core' 'gdk-pixbuf2' 'cairo' 'gtk3' 'xcb-util-keysyms'
	 'libxcb' 'fontconfig' 'wayland' 'zlib' 'glib2' 'libxkbcommon' 'libx11'
	 'freetype2' 'krb5' 'dbus' 'xcb-util-wm' 'xcb-util-image' 'xcb-util-renderutil'
	 'libdrm' 'libxkbcommon-x11'
 )
replaces=("vtf-thumbnailer")
provides=("${pkgname::-4}")
conflicts=("${pkgname::-4}" "vtf-thumbnailer")
source=("MareTF-Linux-x86_64-${pkgver}.tar.zst::$url/releases/download/v${pkgver}/MareTF-Linux-x86_64.tar.zst")
sha256sums=('50a82b1455c912834763b03407822d86d184c0cf0fc0b8cf61fc3b0da755eda5')

package() {
	cd "$srcdir"
	install -Dm755 "$srcdir/MareTF-${pkgver}-Linux/${pkgname::-4}" "$pkgdir/usr/bin/${pkgname::-4}"
	install -Dm755 "$srcdir/MareTF-${pkgver}-Linux/${pkgname::-4}_gui" "$pkgdir/usr/bin/${pkgname::-4}_gui"
	install -Dm755 "$srcdir/MareTF-${pkgver}-Linux/${pkgname::-4}_thumbnailer" "$pkgdir/usr/bin/${pkgname::-4}_thumbnailer"
	cp -a "${srcdir}/MareTF-${pkgver}-Linux/share" "${pkgdir}/usr/share/"
	install -dm755 "${pkgdir}/usr/lib/${pkgname::-4}/"
	cp -a "${srcdir}/MareTF-${pkgver}-Linux/"{lib,plugins} "${pkgdir}/usr/lib/${pkgname::-4}/"
	mv "${pkgdir}/usr/share/licenses/${pkgname::-4}" "${pkgdir}/usr/share/licenses/${pkgname}"
	patchelf --set-rpath "/usr/lib/${pkgname::-4}/lib" "$pkgdir/usr/bin/${pkgname::-4}"
	patchelf --set-rpath "/usr/lib/${pkgname::-4}/lib" "$pkgdir/usr/bin/${pkgname::-4}_gui"
	patchelf --set-rpath "/usr/lib/${pkgname::-4}/lib" "$pkgdir/usr/bin/${pkgname::-4}_thumbnailer"
}
