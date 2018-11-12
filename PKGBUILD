# Maintainer: Michael Taboada <michael@2mb.solutions>
pkgname=munin-libvirt-git
pkgver=r36.e3442fb
pkgrel=2
pkgdesc="libvirt plugins for munin system monitoring"
arch=(any)
url="https://github.com/MikeQG/munin-libvirt-plugins"
license=('GPL2')
depends=('munin-node' 'libvirt-python2' 'python2-lxml')
makedepends=('git' 'pychecker')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=('munin-libvirt::git+https://github.com/MikeQG/munin-libvirt-plugins.git'
	'python2.patch')
md5sums=('SKIP'
	'80bc3b1a35f821c97ba4f3ab88dbd7e3')

pkgver() {
	cd "$srcdir/${pkgname%-git}"

	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
	cd "$srcdir/${pkgname%-git}"
	patch -p1 -i ../python2.patch
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
