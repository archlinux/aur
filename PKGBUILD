pkgname=key-mapper-git
pkgver=1.2.1
pkgrel=2
pkgdesc="A tool to change and program the mapping of your input device buttons."
arch=('any')
url="https://github.com/sezanzeb/key-mapper/"
license=('GPL3')
depends=('python-gobject' 'python-pydbus' 'python-evdev' 'gtk3' 'python-setuptools')
makedepends=('git' 'fakeroot' 'python-setuptools')
provides=('key-mapper')
conflicts=('key-mapper')
install=key-mapper-git.install
source=("git+https://github.com/sezanzeb/key-mapper.git")
md5sums=('SKIP')
_gitname="key-mapper"

pkgver() {
	cd "$srcdir"/"$_gitname"
	( set -o pipefail
	  git describe --long --tags 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
	  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
	)
}

build() {
	cd "$srcdir"/"$_gitname"
	python3 setup.py build
}

package() {
	cd "$srcdir"/"$_gitname"
	python3 setup.py install --root=$pkgdir
}

