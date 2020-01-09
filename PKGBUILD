# Maintainer: Ruslan Magomedov <rmagomedov.iam@yahoo.com>
pkgname=scanastudio
pkgver=4.0.11
pkgrel=1
epoch=
pkgdesc="ScanaStudio is a software for Ikalogic logic analyzers"
arch=('x86_64')
url="https://www.ikalogic.com/"
license=('unknown')
groups=()
depends=('libftd2xx>=1.4.8')
makedepends=()
checkdepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=(
	"https://cdn.ikalogic.com/dist/scanastudio/package/ScanaStudio.tar.bz2"
	"scanastudio.desktop"
)
noextract=()
sha256sums=(
	'653caa9e86dc2cb16055997b404fe8c6dc53f1d0a2b2f7999dfe1aaae7de8357'
	'abb172b2fa0f00380c9c34b5ce51ae35b7434e93da127c23336bf9de81b49957'
)
validpgpkeys=()

package() {
	mkdir $pkgdir/opt
	cp -r $srcdir/ScanaStudio/x86_64/bin $pkgdir/opt/scanastudio
        install -Dm644 $srcdir/ScanaStudio/x86_64/driver/99-ikalogic.rules $pkgdir/etc/udev/rules.d/99-ikalogic.rules
	install -Dm644 scanastudio.desktop $pkgdir/usr/share/applications/scanastudio.desktop
	install -Dm644 $srcdir/ScanaStudio/x86_64/mime/ScanaStudio.xml $pkgdir/usr/share/mime/packages/scanastudio.xml

	mkdir -p $pkgdir/usr/share/icons
	cp -r $srcdir/ScanaStudio/x86_64/mime/hicolor $pkgdir/usr/share/icons/
	install -Dm644 $srcdir/ScanaStudio/x86_64/mime/application-x-ScanaStudio.png $pkgdir/usr/share/icons/hicolor/192x192/mimetypes/application-x-ScanaStudio.png

	find $pkgdir/ -type f -print0 | xargs -0 chmod -x
	chmod +x $pkgdir/opt/scanastudio/{ScanaStudio,update}

	mkdir -p $pkgdir/usr/bin
	ln -s /opt/scanastudio/ScanaStudio $pkgdir/usr/bin/scanastudio
}
