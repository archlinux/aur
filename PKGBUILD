# Maintainer: Ali Molaei <ali dot molaei at protonmail dot com>

pkgname=proton-vpn-gtk-app
_gitpkgname=proton-vpn-gtk-app
pkgver=4.1.8
pkgrel=1
pkgdesc="ProtonVPN GTK app, Maintained by Community"
arch=("any")
url="https://github.com/ProtonVPN/proton-vpn-gtk-app"
license=("GPL3")
groups=("ProtonVPN")
depends=("python-proton-core"
		 "python-proton-vpn-api-core"
		 "python-proton-vpn-connection" 
		 "python-proton-keyring-linux"
		 "python-proton-keyring-linux-secretservice"
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
		 "python-requests"
		 "python-packaging"
		 "python-pynacl"
		 "python-pyopenssl"
		 "webkit2gtk"
		 "dbus-python"
		 "gtk3")
optdepends=("libappindicator-gtk3")
makedepends=("python-setuptools")
#source=("git+https://github.com/ProtonVPN/proton-vpn-gtk-app.git#tag=${pkgver}")
source=("git+https://github.com/ProtonVPN/proton-vpn-gtk-app.git#commit=043ee088f3c48d4f9ca89be157b9ea05db51130a"
				"fix-startup-wm-class.patch")
sha256sums=('SKIP'
						"c483129a66171bd6b13a54193c8373173bb0bfbc556c4aa1fbae0c2ef0063f4e")
conflicts=('protonvpn-gui' 'python-proton-client')

prepare() {
		cd "$_gitpkgname"
    cat ../fix-startup-wm-class.patch | patch -p1
}

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
