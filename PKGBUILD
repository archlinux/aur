# Maintainer: Michael Taboada <michael@2mb.solutions>
pkgname=munin-libvirt-git
pkgver=r36.e3442fb
pkgrel=1
pkgdesc="libvirt plugins for munin system monitoring"
arch=(any)
url="https://github.com/MikeQG/munin-libvirt-plugins"
license=('GPL2')
depends=('munin-node' 'libvirt-python' 'python-lxml')
makedepends=('git' 'pychecker')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=('munin-libvirt::git+https://github.com/MikeQG/munin-libvirt-plugins.git')
md5sums=('SKIP')

pkgver() {
	cd "$srcdir/${pkgname%-git}"

	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	cd "$srcdir/${pkgname%-git}"
	make
}

check() {
	cd "$srcdir/${pkgname%-git}"
	make -k check
}

package() {
	cd "$srcdir/${pkgname%-git}"
	make DESTDIR="$pkgdir/" SBINDIR="/usr/bin/" install
}
