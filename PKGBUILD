# Maintainer: Tony Lambiris <tony@libpcap.net>

pkgname=gnome-shell-extension-bumblebee-status-git
pkgver=r14.17cd4c1
pkgrel=2
pkgdesc="GNOME Shell extension that shows the status of the NVIDIA GPU"
arch=('any')
url="https://github.com/dsboger/gnome-shell-extension-bumblebee-status"
license=('GPL3')
depends=('gnome-shell' 'unzip')
makedepends=('git')
source=("${pkgname}::git+${url}")
sha256sums=('SKIP')

pkgver() {
	cd "${srcdir}/${pkgname}"

	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	cd "${srcdir}/${pkgname}"

	./autogen.sh
	./configure --prefix=/usr

	make
}

package() {
	cd "${srcdir}/${pkgname}"

	make DESTDIR="${pkgdir}" install
}
