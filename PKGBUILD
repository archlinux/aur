# Maintainer: Andrew <andrew@cyberdiary.net>

pkgname=usb-killswitch
pkgver=1.1.0
pkgrel=1
pkgdesc="Shuts down your laptop when a USB device disconnects"
arch=('any')
url="https://github.com/CyberDiary2/killswitch2_0"
license=('custom')
depends=('python' 'tk' 'python-pillow' 'python-pystray')
source=("$pkgname-$pkgver.tar.gz::https://github.com/CyberDiary2/killswitch2_0/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('SKIP')

package() {
    cd "$srcdir/killswitch2_0-$pkgver"

    # Install main script
    install -Dm755 usb_killswitch.py "$pkgdir/usr/bin/usb-killswitch"

    # Install desktop entry
    install -Dm644 /dev/stdin "$pkgdir/usr/share/applications/usb-killswitch.desktop" <<EOF
[Desktop Entry]
Type=Application
Name=USB Kill Switch
GenericName=USB Kill Switch
Comment=Shuts down your laptop when a USB device disconnects
Exec=usb-killswitch
Icon=usb-killswitch
Terminal=false
Categories=Security;Utility;System;
Keywords=usb;kill;switch;security;shutdown;deadman;
StartupNotify=false
EOF

    # Install docs
    install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
}
