# Maintainer: asukaminato <i at asukaminato dot eu dot org>
pkgname=ctool-bin
pkgver="2.3.0"
pkgrel=1
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
	glib2
	gdk-pixbuf2
	hicolor-icon-theme
	libsoup
)
source=("${_url}/releases/download/v${pkgver}/ctool_tauri_linux.deb"
	https://raw.githubusercontent.com/baiy/Ctool/master/LICENSE
)
sha256sums=('b47704172f1d2c1fd9b13ebedb19ca80c693f7c59fdce412f69772a9c10b7955'
            '459af2e36090998e7807b1d2a5b8d6a381bf94b69cbd2ec68e7943a09e2ce1e2')
package() {
	tar -xvpf ${srcdir}/data.tar.gz -C $pkgdir
	chown root:root -R $pkgdir
	# fix https://bugs.webkit.org/show_bug.cgi?id=256663
	sed -i "s/Exec=ctool/Exec=JSC_useDFGJIT=0 ctool/" $pkgdir/usr/share/applications/ctool.desktop

	install -Dm644 LICENSE -t $pkgdir/usr/share/licenses/$pkgname/
}
