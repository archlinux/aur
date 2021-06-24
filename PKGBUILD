# Maintainer: Pranav Jerry <libreinator at disroot dot org>
_basename=naxalnet
pkgname="$_basename-git"
pkgver=0.1.0.r2.g47f2324
pkgrel=1
pkgdesc="Python script to create a batman-adv mesh network (development version)"
arch=("any")
url="https://git.disroot.org/pranav/${_basename}"
license=("GPL3")
depends=("iwd" "python-dasbus" "systemd>=248")
optdepends=("batctl: for debugging")
makedepends=(git)
provides=(naxalnet)
source=("git+${url}.git")
sha256sums=('SKIP')

pkgver() {
	cd "${srcdir}/$_basename"
	git describe --long --tags|sed -r 's/^v//;s/([^-]*-g)/r\1/;s/-/./g'
}

package() {
	cd "$srcdir/$_basename"
	make DESTDIR="$pkgdir/" install
	return $?
}
