# Maintainer: Igor Dyatlov <dyatlov.igor@protonmail.com>
# Contributor: Sergei Kolesnikov <youremail@domain.com>

pkgname=gnome-shell-extension-runcat-git
pkgver=21.r2.g8370617
pkgrel=1
pkgdesc="The cat tells you the CPU usage by running speed"
arch=('any')
url="https://github.com/win0err/gnome-runcat"
license=('GPL3')
depends=('gnome-shell')
makedepends=('git')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=(git+$url.git)
_srcname=gnome-runcat
b2sums=('SKIP')

pkgver() {
	cd "$srcdir/${_srcname}"
	git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
	cd "$_srcname"
	make build
}

package() {
	_uuid='runcat@kolesnikov.se'
	cd "$_srcname"
	install -d "$pkgdir/usr/share/gnome-shell/extensions/$_uuid"
	bsdtar -xvf dist/$_uuid.shell-extension.zip -C "$pkgdir/usr/share/gnome-shell/extensions/$_uuid"
}
