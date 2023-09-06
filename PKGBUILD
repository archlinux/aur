# Maintainer: asukaminato <i at asukaminato dot eu dot org>
pkgname=ctool-bin
pkgver="2.2.0"
pkgrel=3
pkgdesc='程序开发常用工具 chrome /edge/firefox /utools/windows /linux/mac'
arch=('x86_64')
url="https://ctool.dev"
_url="https://github.com/baiy/Ctool"
license=('MIT')
depends=('webkit2gtk'
	'gtk3'
	gcc-libs
	glibc
	openssl
	dbus
	glib2
	gdk-pixbuf2
	hicolor-icon-theme
)
source=("${_url}/releases/download/v${pkgver}/ctool_tauri_linux.deb")
sha256sums=('539970c496b116b80333eac5b61f483484ffd81b196d38d8194080818da286a4')
package() {
	tar -xvpf ${srcdir}/data.tar.gz -C $pkgdir
	chown root:root -R $pkgdir
	# fix https://bugs.webkit.org/show_bug.cgi?id=256663
	sed -i "s/Exec=ctool/Exec=JSC_useDFGJIT=0 ctool/" $pkgdir/usr/share/applications/ctool.desktop
}
