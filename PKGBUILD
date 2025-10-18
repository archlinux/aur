# Maintainer: sezanzeb b8x45ygc9@mozmail.com
# Contributor: Sven Karsten Greiner <sven@sammyshp.de>

pkgname=input-remapper-git
_pkgname=${pkgname%-git}
pkgver=2.1.1.r3.g96c18c53
pkgrel=1
pkgdesc="A tool to change and program the mapping of your input device buttons."
arch=('any')
url="https://github.com/sezanzeb/input-remapper/"
license=('GPL-3.0-or-later')
depends=('gtk3' 'gtksourceview4' 'python-cairo' 'python-evdev' 'python-gobject' 'python-packaging' 'python-psutil' 'python-pydantic' 'python-pydbus')
optdepends=('xorg-xmodmap: symbol names matching the keyboard layout')
makedepends=('git' 'python-setuptools')
provides=("$_pkgname")
conflicts=("$_pkgname" 'key-mapper')
install=input-remapper-git.install
source=("$_pkgname::git+https://github.com/sezanzeb/input-remapper.git")
sha256sums=('SKIP')

pkgver() {
	cd "$srcdir/$_pkgname"
	git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
	cd "$srcdir/$_pkgname"
	python setup.py build
}

package() {
	cd "$srcdir/$_pkgname"
	python setup.py install --root="$pkgdir"
}
