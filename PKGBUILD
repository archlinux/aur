# Maintainer: tembleking <tembleking at gmail dot com>
pkgname=lhc-dashboard-desktop
pkgver=1.4.3
pkgrel=1
pkgdesc="LHC Dashboard for desktop. Uses Electron, v1.4.3"
arch=('i686' 'x86_64')
url="https://lhcdashboard.web.cern.ch/"
license=('unknown')
makedepends=('nodejs-nativefier')
provides=('lhc-dashboard-desktop')
source=('lhc-dashboard-desktop.png'
        'lhc-dashboard-desktop.desktop'
        'lhc-dashboard-desktop.sh')

sha512sums=('27f2254ea42e5930aae679a682396580b415cae10ea36c895221bb2001100c22521394ca5cfba9c30d3784192a266469d41f0b9546f79c0ec04caaee9f9f2958'
            '7f0f1e0c3e2113890ff8416eae29dd457a5bb179c631a78c94cfa07dcf3964ebf32feba6bd3f1bb097a4242a51b8b317ecf5ac7afb3ef5eb978b9ab187c7f488'
            '25f1d8d850772eb65bbad5d0bf2fc9f900ac9fe9c0e3bb180a9066324befba445d715f6db67fe2916aa94c02a8a6dd18dc17fc768247eea4a02310ccf21efd67')

options=('!strip')

build() {
	cd $srcdir
 # op-webtools.web.cern.ch/Vistar/vistars.php
	nativefier lhcdashboard.web.cern.ch \
		--name "lhc-dashboard" \
		--disable-context-menu \
		--disable-dev-tools \
		--width 720px \
		--height 720px \
		--min-width 720px \
		--min-height 720px \
		--electron-version 1.4.3 \
		--honest \
		-i "../$pkgname.png"

	rm -rf lhc-dashboard
	mv lhc-dashboard-linux* lhc-dashboard
}

package() {
	install -dm755 "$pkgdir/opt/lhc-dashboard"
	install -dm755 "$pkgdir/usr/bin/"
	install -dm755 "$pkgdir/usr/share/pixmaps/"
	install -dm755 "$pkgdir/usr/share/applications/"

	cp -R "$srcdir/lhc-dashboard/." "$pkgdir/opt/lhc-dashboard/"
	chmod 755 "$pkgdir/opt/lhc-dashboard/resources/app"

	install -Dm755 "$srcdir/$pkgname.desktop" "$pkgdir/usr/share/applications/$pkgname.desktop"
	install -Dm755 "$srcdir/$pkgname.png" "$pkgdir/usr/share/pixmaps/lhc-dashboard.png"
	install -Dm755 "$srcdir/$pkgname.sh" "$pkgdir/usr/bin/$pkgname"
}

