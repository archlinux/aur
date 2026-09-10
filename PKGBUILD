# Maintainer: Patrick Northon <northon_patrick3@yahoo.ca>

pkgname=sshpilot
pkgver=6.0.9
pkgrel=1
pkgdesc='SSH connection manager with integrated terminal, tunneling, tabbed interface and scp upload support.'
url='https://github.com/mfat/sshpilot'
license=('GPL-3.0-only')
depends=('python' 'libadwaita')
makedepends=(
	'python-setuptools' 'python-build' 'python-installer' 'python-wheel'
	'meson' 'blueprint-compiler' 'gtk-update-icon-cache' 'desktop-file-utils')
arch=('any')
sha256sums=('fb9d402c1fad6a5eea0c4760ab89ece6abe6f25d909ff4b1519c443124affd02')
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
