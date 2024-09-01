# Maintainer: Alex Henrie <alexhenrie24@gmail.com>
pkgname=stig-viewer-bin
pkgver=3.4
pkgrel=1
pkgdesc="Graphical user interface for XCCDF STIG files"
arch=('x86_64')
url="https://public.cyber.mil/stigs/srg-stig-tools/"
license=('custom')
makedepends=('asar')
provides=("stig-viewer=${pkgver}")
conflicts=('stig-viewer')
source=("https://dl.dod.cyber.mil/wp-content/uploads/stigs/zip/U_STIGViewer-linux_x64-3-4-0.zip"
        "local://stig-viewer.desktop")
sha256sums=('39debcb9c75fd9e7da2bf4e2bb38fc65a64cb6a43b58dac20d46f9c9726e4a22'
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
