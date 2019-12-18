# Maintainer: Tony Lambiris <tony@libpcap.net>

pkgname=gnome-shell-extension-bumblebee-status-git
_gitname=gnome-shell-extension-bumblebee-status
pkgver=r14.17cd4c1
pkgrel=1
pkgdesc="GNOME Shell extension that shows the status of the NVIDIA GPU"
arch=('any')
url="https://github.com/dsboger/gnome-shell-extension-bumblebee-status"
license=('GPL3')
depends=('gnome-shell' 'unzip')
makedepends=('git')
source=('git+https://github.com/dsboger/gnome-shell-extension-bumblebee-status.git')
sha256sums=('SKIP')

pkgver() {
	cd $_gitname

	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	cd $_gitname

	./autogen.sh
	./configure --prefix=/usr

	make ${MAKEFLAGS} zip-file
}

package() {
	cd $_gitname

	_extid="gnome-shell-extension-bumblebee-status.dsboger@gmail.com"
	_extpath="${pkgdir}/usr/share/gnome-shell/extensions/${_extid}"

	install -dm755 "${_extpath}"

	unzip -q -d "${_extpath}" "${_gitname}.zip"
}
