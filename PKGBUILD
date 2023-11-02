# Maintainer: Ali Molaei <ali dot molaei at protonmail dot com>

pkgname=proton-vpn-gtk-app
_gitpkgname=proton-vpn-gtk-app
pkgver=4.1.0
pkgrel=5
pkgdesc="ProtonVPN GTK app"
arch=("any")
url="https://github.com/ProtonVPN/proton-vpn-gtk-app"
license=("GPL3")
groups=("ProtonVPN")
depends=("python-proton-core"
		 "python-proton-vpn-api-core"
		 "python-proton-vpn-connection" 
		 "python-proton-vpn-logger"
		 "python-proton-vpn-network-manager"
		 "python-proton-vpn-network-manager-openvpn"
		 "python-proton-vpn-killswitch"
		 "python-proton-vpn-killswitch-network-manager"
		 "python-proton-vpn-session"
		 "python-aiohttp"
		 "python-bcrypt"
		 "python-cairo"
		 "python-distro"
		 "python-gnupg"
		 "python-gobject"
		 "python-jinja"
		 "python-pynacl"
		 "python-pyopenssl"
		 "python-psutil"
		 "webkit2gtk"
		 "dbus-python"
		 "gtk3")
optdepends=("libappindicator-gtk3")
makedepends=("python-setuptools")
source=("git+https://github.com/ProtonVPN/proton-vpn-gtk-app.git#tag=${pkgver}")
sha256sums=('SKIP')
conflicts=('protonvpn-gui' 'python-proton-client')
build() {
    cd "$_gitpkgname"
    python setup.py build
}

package() {
    cd "$_gitpkgname"
    install -d -m755 "${pkgdir}/usr/share/applications"
    install -d -m755 "${pkgdir}/usr/share/icons/hicolor/scalable/apps/"

    cp ./rpmbuild/SOURCES/protonvpn-app.desktop "${pkgdir}/usr/share/applications/protonvpn.desktop"
    cp ./rpmbuild/SOURCES/proton-vpn-logo.svg "${pkgdir}/usr/share/icons/hicolor/scalable/apps/"
    
    python setup.py install --root="$pkgdir" --optimize=1
}
