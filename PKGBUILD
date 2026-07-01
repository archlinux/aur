pkgname=swiftpoint-x1-control-panel
pkgver=3.1.0.76
pkgrel=1
pkgdesc="Control panel for Swiftpoint devices"
arch=('x86_64')
url="https://support.swiftpoint.com/portal/en/kb/articles/swiftpoint-x1-control-panel-download"
license=('custom')
options=(!debug)
source=(
   	"Swiftpoint_X1_Control_Panel_${pkgver}.tar.xz::https://swiftpointdrivers.blob.core.windows.net/pro/beta/linux/Swiftpoint%20X1%20Control%20Panel%20${pkgver}-db4a0109.tar.xz"
	"com.swiftpoint.png::https://support.swiftpoint.com/portal/api/publicImages/236657000020283222?portalId=edbsn0d3aa90196a4e3b6b39dfa53f41ea57346e362747d42eef1744d58b0281647e9"
	"com.swiftpoint.X1_Control_Panel.desktop"
	"swiftpoint-x1-control-panel.service"
)
install=Swiftpoint_X1_Control_Panel.install
sha256sums=('ccb708a05fe7a0f355c140e81c9a2901c4f6b391edc0415d109592c40351ce0a'
            'a7117e87abf569325fe6257d5ec5e7043b156d06feebd9ac22bd54f181b936f9'
            '1f392375193f0ce122b0d0c8f10e3f50b6ca60f0fbfdd6e3f26f3b765ee14c0d'
	    '0b06cc7dd26a4743b7333b2ebf575828c73c8e652ea572fa177cfcbdc9faed23')

package() {
	cd "${srcdir}/Swiftpoint X1 Control Panel ${pkgver}"

    	install -Dm755 "Swiftpoint X1 Control Panel" \
        	"$pkgdir/usr/lib/swiftpoint/Swiftpoint X1 Control Panel"
	install -Dm644 "qt.conf" \
		"$pkgdir/usr/lib/swiftpoint/qt.conf"
	install -Dm644 "Starter Mappings.spcf" \
		"$pkgdir/usr/lib/swiftpoint/Starter Mappings.spcf"
	

	cp -r lib "$pkgdir/usr/lib/swiftpoint/lib"
	cp -r plugins "$pkgdir/usr/lib/swiftpoint/plugins"
	cp -r translations "$pkgdir/usr/lib/swiftpoint/translations"
	cp -r profiles "$pkgdir/usr/lib/swiftpoint/profiles"

	install -Dm755 /dev/stdin "$pkgdir/usr/bin/swiftpoint-x1-control-panel" <<EOF
#!/bin/sh
export LD_LIBRARY_PATH="/usr/lib/swiftpoint/lib:\$LD_LIBRARY_PATH"
exec "/usr/lib/swiftpoint/Swiftpoint X1 Control Panel" "\$@"
EOF

    	install -Dm644 "60-Swiftpoint.rules" \
        	"$pkgdir/usr/lib/udev/rules.d/60-Swiftpoint.rules"
	install -Dm644 "${srcdir}/com.swiftpoint.png" \
		"$pkgdir/usr/share/pixmaps/com.swiftpoint.png"
    	install -Dm644 "${srcdir}/com.swiftpoint.X1_Control_Panel.desktop" \
        	"$pkgdir/usr/share/applications/com.swiftpoint.X1_Control_Panel.desktop"
	install -Dm644 "Swiftpoint X1 Control Panel Licence.txt" \
		"$pkgdir/usr/share/licenses/$pkgname/LICENSE"
	install -Dm644 "${srcdir}/swiftpoint-x1-control-panel.service" \
    		"$pkgdir/usr/lib/systemd/user/swiftpoint-x1-control-panel.service"
}
