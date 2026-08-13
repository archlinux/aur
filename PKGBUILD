# Maintainer: Patrick Northon <northon_patrick3@yahoo.ca>

pkgname=sshpilot
pkgver=5.8.0
pkgrel=1
pkgdesc='SSH connection manager with integrated terminal, tunneling, tabbed interface and scp upload support.'
url='https://github.com/mfat/sshpilot'
license=('GPL-3.0-only')
depends=('python' 'libadwaita')
makedepends=(
	'python-setuptools' 'python-build' 'python-installer' 'python-wheel'
	'meson' 'blueprint-compiler' 'gtk-update-icon-cache' 'desktop-file-utils')
arch=('any')
sha256sums=('c93e18e530c26221700474676a10590ae53632d7e6c7acd5d001c37cbbe07071')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")

_srcdir="${pkgname}-${pkgver}"

build() {
	arch-meson "${_srcdir}" build
}

package() {
	depends+=(
		'python-gobject' 'python-cairo' 'python-paramiko' 'python-cryptography' 'python-matplotlib'
		'vte4' 'sshpass' 'libsecret' 'gtksourceview5' 'webkitgtk-6.0' 'python-flask' 'python-flask-socketio')

	meson install -C build --destdir "$pkgdir"
}
