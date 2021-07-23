# Maintainer: Pranav Jerry <libreinator at disroot dot org>
_basename=naxalnet
pkgname="$_basename-git"
pkgver=0.1.0.r23.gc8e98b2
pkgrel=1
pkgdesc="Helper to create a batman-adv mesh network (development version)"
arch=("any")
url="https://git.disroot.org/pranav/${_basename}"
license=("GPL3")
depends=("iwd" "python-dasbus" "systemd>=248")
optdepends=("batctl: for debugging")
makedepends=('git' 'python-setuptools')
provides=(naxalnet)
source=("git+${url}.git")
sha256sums=('SKIP')

pkgver() {
	cd "${srcdir}/$_basename"
	git describe --long --tags|sed -r 's/^v//;s/([^-]*-g)/r\1/;s/-/./g'
}

build() {
	cd "${srcdir}/$_basename"
	make
	return $?
}

package() {
	cd "$srcdir/$_basename"
	make DESTDIR="$pkgdir" install
	return $?
}
