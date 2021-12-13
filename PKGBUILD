# Maintainer: Parker Reed <parker.l.reed@gmail.com>
# PKGBUILD that builds package from git.
# Run 'makepkg -i' and hope for best :)

pkgname=sc-controller-git
pkgver=v0.4.8.6.r14.3ce2d23c
pkgrel=1
pkgdesc='User-mode driver and GTK3 based GUI for Steam Controller'
arch=('any')
url='https://github.com/Ryochan7/sc-controller'
license=('GPL2')
depends=('gtk3' 'python-gobject' 'python-cairo' 'python-pylibacl' 'python-evdev' 'xorg-xinput')
makedepends=('python-setuptools' 'git')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=('sc-controller'::'git+https://github.com/Ryochan7/sc-controller.git')
sha256sums=('SKIP')

pkgver() {
	cd "$srcdir/${pkgname%-git}"
	printf "%s" "$(git describe --tags --long | sed 's/\([^-]*-\)g/r\1/;s/-/./g')"
}

build() {
	cd "$srcdir/${pkgname%-git}"
	python setup.py build
}

package() {
	cd "$srcdir/${pkgname%-git}"
	python setup.py install --root="${pkgdir}" --optimize=1
}
