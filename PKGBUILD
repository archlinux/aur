# Maintainer: Pranav Jerry <libreinator at disroot dot org>
_basename=pybatmesh
pkgname="$_basename-git"
pkgver=0.5.3.r0.g0c6bdea
pkgrel=1
pkgdesc="Python script to create a batman-adv mesh network (development version)"
arch=("any")
url="https://git.disroot.org/pranav/$_basename"
license=("GPL3")
depends=("iwd" "python-dasbus" "systemd>=248" "python-systemd")
optdepends=("batctl: for debugging")
makedepends=('git' 'python-setuptools')
replaces=(naxalnet-git)
provides=($_basename)
conflicts=(naxalnet naxalnet-git $_basename)
source=("git+${url}.git")
sha256sums=('SKIP')

pkgver() {
	cd "${srcdir}/$_basename"
	git describe --long --tags|sed -r 's/^v//;s/([^-]*-g)/r\1/;s/-/./g'
	#./setup.py --version
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
