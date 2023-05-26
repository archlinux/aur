# Maintainer: Tony Lambiris <tony@libpcap.net>

pkgname=gnome-shell-extension-screenshot-git
pkgver=r296.068bb6f
pkgrel=1
pkgdesc="Gnome Shell extension for making and uploading screenshots"
arch=('any')
url="https://github.com/OttoAllmendinger/gnome-shell-screenshot.git"
license=('MIT')
depends=('gnome-shell')
makedepends=('git' 'zip' 'unzip' 'eslint')
source=("${pkgname}::git+${url}")
md5sums=('SKIP')

pkgver() {
	cd "${srcdir}/${pkgname}"

	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
	cd "${srcdir}/${pkgname}"

	make update_dependencies
}

package() {
	cd "${srcdir}/${pkgname}"

	_extid="gnome-shell-screenshot@ttll.de"
	_extpath="${pkgdir}/usr/share/gnome-shell/extensions/${_extid}"

	make EXTENSION_PATH="${_extpath}" install
}
