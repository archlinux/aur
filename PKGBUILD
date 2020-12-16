# Maintainer: Alexandru Cheltutior <acrandom@pm.me>

pkgname=protonvpn-linux-gui
pkgver=2.1.1
pkgrel=2
pkgdesc="ProtonVPN Linux application"
arch=("x86_64")
url="https://github.com/ProtonVPN/linux-gui/"
license=("GPL3")
depends=("python>=3.5" "python-requests>=2.23.0" "python-configparser>=4.0.2" "python-gobject" "gtk3" "libappindicator-gtk3" "protonvpn-cli-ng")
makedepends=("python-setuptools")
source=("https://github.com/ProtonVPN/linux-gui/archive/v$pkgver.tar.gz")
md5sums=('27b0a5e6ab1985fadc2d7f8880a2cb28')

package() {
	cd "linux-gui-$pkgver"
	python setup.py install --optimize=1 --root="$pkgdir"
	install -d -m755 "${pkgdir}/usr/share/applications"

_pydir=$(python -c 'import site; print(site.getsitepackages()[0])')

# Gui Desktop Icon
cat <<EOF > "${pkgdir}/usr/share/applications/protonvpn-gui.desktop"
[Desktop Entry]
Name=ProtonVPN GUI
Version=2.0.0
Comment=${pkgdesc}
Exec=protonvpn-gui
Icon=${_pydir}/usr/lib/python3.8/site-packages/linux_gui/resources/img/logo/protonvpn_logo.png
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
Icon=${_pydir}/usr/lib/python3.8/site-packages/linux_gui/resources/img/logo/protonvpn_logo.png
Terminal=false
StartupNotify=false
Type=Application
Categories=Utility;GUI;Network;VPN
EOF
}

