# Maintainer: Ali Molaei <ali dot molaei at protonmail dot com>

pkgname=proton-vpn-gtk-app
_gitpkgname=proton-vpn-gtk-app
pkgver=4.1.0
pkgrel=4
pkgdesc="ProtonVPN GTK app"
arch=("any")
url="https://github.com/ProtonVPN/proton-vpn-gtk-app"
license=("GPL3")
groups=("ProtonVPN")
depends=("python-proton-vpn-network-manager" "python-proton-vpn-logger" "python-proton-vpn-session" "python-proton-vpn-connection" "python-proton-vpn-api-core"
		 "python-proton-core" "python-proton-vpn-killswitch" "python-proton-vpn-killswitch-network-manager" "python-proton-vpn-network-manager-openvpn" "python-bcrypt"
		 "python-pynacl" "python-pyopenssl" "python-distro" "python-gnupg" "python-jinja" "python-gobject" "python-psutil" "python-aiohttp" "gtk3" "python-cairo" "webkit2gtk")
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
