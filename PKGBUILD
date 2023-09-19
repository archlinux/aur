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
	https://github.com/baiy/Ctool/blob/master/LICENSE
)
sha256sums=('b47704172f1d2c1fd9b13ebedb19ca80c693f7c59fdce412f69772a9c10b7955'
	'ba90c39387c4e93fc868640ef6964d5823ff68dff0243148d174a29d76fc2ae7')
package() {
	tar -xvpf ${srcdir}/data.tar.gz -C $pkgdir
	chown root:root -R $pkgdir
	# fix https://bugs.webkit.org/show_bug.cgi?id=256663
	sed -i "s/Exec=ctool/Exec=JSC_useDFGJIT=0 ctool/" $pkgdir/usr/share/applications/ctool.desktop

	install -Dm644 LICENSE -t $pkgdir/usr/share/licenses/$pkgname/
}
