# Maintainer: Ali Molaei <ali dot molaei at protonmail dot com>

pkgname=proton-vpn-gtk-app
pkgver=4.6.0
pkgrel=2
pkgdesc="ProtonVPN GTK app, Maintained by Community"
arch=("any")
url="https://github.com/ProtonVPN/proton-vpn-gtk-app"
license=("GPL3")
groups=("ProtonVPN")
depends=("python-proton-core"
		"python-proton-vpn-api-core"
		"python-proton-keyring-linux"
		"python-proton-vpn-network-manager"
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
		"python-sentry_sdk"
		"webkit2gtk"
		"dbus-python"
		"gtk3")
optdepends=("libappindicator-gtk3")
makedepends=("git" "python-setuptools")
source=("git+https://github.com/ProtonVPN/proton-vpn-gtk-app.git#tag=v${pkgver}")
sha256sums=('SKIP')
conflicts=('protonvpn-gui' 'python-proton-client')

build() {
	cd "$pkgname"
	python setup.py build
}

package() {
	cd "$pkgname"
	install -d -m755 "${pkgdir}/usr/share/applications"
	install -d -m755 "${pkgdir}/usr/share/icons/hicolor/scalable/apps/"

	cp ./rpmbuild/SOURCES/protonvpn-app.desktop "${pkgdir}/usr/share/applications/protonvpn.desktop"
	cp ./rpmbuild/SOURCES/proton-vpn-logo.svg "${pkgdir}/usr/share/icons/hicolor/scalable/apps/"
	
	python setup.py install --root="$pkgdir" --optimize=1
}
