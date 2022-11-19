# Maintainer: sezanzeb proxima@seanzeb.de
pkgname=input-remapper-beta-git
pkgver=1.5.0.beta.r46.geff463e6
pkgrel=1
pkgdesc="Beta version of input-remapper. Contains unfinished features that require testing."
arch=('any')
url="https://github.com/sezanzeb/input-remapper/tree/beta"
license=('GPL3')
depends=('python-gobject' 'python-pydbus' 'python-evdev' 'gtk3' 'python-setuptools' 'gtksourceview4' 'python-pydantic')
optdepends=('xorg-xmodmap: symbol names matching the keyboard layout')
makedepends=('git' 'fakeroot' 'python-setuptools')
conflicts=('input-remapper' 'key-mapper')
install=input-remapper-git.install
source=("git+https://github.com/sezanzeb/input-remapper.git#branch=beta")
md5sums=('SKIP')
_gitname="input-remapper"

pkgver() {
	cd "$srcdir"/"$_gitname"
	( set -o pipefail
	  echo 1.5.0-beta$(git describe --tags | grep -Po "\-.+") | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
	)
}

prepare() {
	cd "$srcdir"/"$_gitname"
}

build() {
	cd "$srcdir"/"$_gitname"
	python3 setup.py build
}

package() {
	cd "$srcdir"/"$_gitname"
	python3 setup.py install --root=$pkgdir
}

