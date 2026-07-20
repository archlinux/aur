# Maintainer: Patrick Northon <northon_patrick3@yahoo.ca>

pkgname=sshpilot
pkgver=5.6.0
pkgrel=1
pkgdesc='SSH connection manager with integrated terminal, tunneling, tabbed interface and scp upload support.'
url='https://github.com/mfat/sshpilot'
license=('GPL-3.0-only')
depends=('python' 'libadwaita')
makedepends=(
	'python-setuptools' 'python-build' 'python-installer' 'python-wheel'
	'meson' 'blueprint-compiler' 'gtk-update-icon-cache' 'desktop-file-utils')
arch=('any')
sha256sums=('a965ca60a15c8d01cea13ed889c0b3e0a896be710b6e3489fc3ec52afee3c254')
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
