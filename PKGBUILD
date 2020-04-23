# Maintainer: Alexandru Cheltutior <acrandom@pm.me>

pkgname=protonvpn-linux-gui
pkgver=2.0.7
pkgrel=1
pkgdesc="Unofficial GUI client for ProtonVPN"
arch=("x86_64")
url="https://github.com/calexandru2018/protonvpn-linux-gui"
license=("GPL3")
depends=("python>=3.5" "python-requests>=2.23.0" "python-configparser>=4.0.2" "openvpn" "python-gobject" "gtk3" "libappindicator-gtk3")
makedepends=("python-setuptools")
source=("https://github.com/calexandru2018/$pkgname/archive/v$pkgver.tar.gz")
md5sums=('eccc7b1353e208ecb86af011311d866b')

package() {
	cd "$pkgname-$pkgver"
	python setup.py install --optimize=1 --root="$pkgdir"
	install -d -m755 "${pkgdir}/usr/share/applications"

# Gui Desktop Icon
cat <<EOF > "${pkgdir}/usr/share/applications/protonvpn-gui.desktop"
[Desktop Entry]
Name=ProtonVPN GUI
Version=2.0.0
Comment=${pkgdesc}
Exec=sudo protonvpn-gui
Icon=/usr/lib/python3.8/site-packages/protonvpn_linux_gui/resources/img/logo/protonvpn_logo.png
Terminal=false
StartupNotify=false
Type=Application
Categories=Utility;GUI;Network;VPN
EOF

# Tray Desktop Icon
cat <<EOF > "${pkgdir}/usr/share/applications/protonvpn-tray.desktop"
[Desktop Entry]
Name=ProtonVPN GUI Tray
Version=2.0.0
Comment=Unofficial ProtonVPN GUI Tray
Exec=protonvpn-tray
Icon=/usr/lib/python3.8/site-packages/protonvpn_linux_gui/resources/img/logo/protonvpn_logo.png
Terminal=false
StartupNotify=false
Type=Application
Categories=Utility;GUI;Network;VPN
EOF
}

