# Maintainer: Alex Henrie <alexhenrie24@gmail.com>
pkgname=stig-viewer-bin
pkgver=3.7
pkgrel=1
pkgdesc="Graphical user interface for XCCDF STIG files"
arch=('x86_64')
url="https://public.cyber.mil/stigs/srg-stig-tools/"
license=('custom')
makedepends=('asar')
provides=("stig-viewer=${pkgver}")
conflicts=('stig-viewer')
source=("https://dl.dod.cyber.mil/wp-content/uploads/stigs/zip/U_STIGViewer-linux_x64-3-7-0.zip"
        "local://stig-viewer.desktop")
sha256sums=('bd6fedb4e74c61fc0ce35a3f9916295b8b018c219c16e4c7881c26e90f5872f0'
            'SKIP')

package() {
	cd "$srcdir"

	mkdir -p "$pkgdir/opt/stig-viewer"
	cp -r stig_viewer_3-linux-x64/* "$pkgdir/opt/stig-viewer"

	mkdir -p "$pkgdir/usr/share/licenses/$pkgname"
	cp stig_viewer_3-linux-x64/LICENSE* "$pkgdir/usr/share/licenses/$pkgname"

	mkdir -p "$pkgdir/usr/share/icons/hicolor/256x256/apps"
	asar extract-file stig_viewer_3-linux-x64/resources/app.asar src/assets/ag_icon.ico
	mv ag_icon.ico "$pkgdir/usr/share/icons/hicolor/256x256/apps/stig-viewer.ico"

	mkdir -p "$pkgdir/usr/share/applications"
	cp stig-viewer.desktop "$pkgdir/usr/share/applications"
}
