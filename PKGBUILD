# Maintainer Kamil Bączkowski <me@kavela.ch>

pkgname=pywal-16-colors
_gitname=pywal16
pkgver=3.3.1.r132.ge7b0970
pkgrel=1
pkgdesc="Generate and change color-schemes on the fly, now with 16 colors."
arch=('any')
url="https://github.com/eylles/pywal16"
license=('MIT')
depends=('python')
makedepends=('python-setuptools')
optdepends=('feh: set wallpaper'
            'nitrogen: set wallpaper'
            'python2: reload gtk2 themes on the fly')
provides=("pywal" "pywal-git")
conflicts=("pywal" "pywal-git")
source=('git+https://github.com/eylles/pywal16.git')
sha256sums=('SKIP')

pkgver() {
	cd "$srcdir/${_gitname}"
	git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
	cd "$srcdir/${_gitname}"
	python setup.py build
}

check() {
	cd "$srcdir/${_gitname}"
	python setup.py test
}

package() {
	echo "${conflicts[@]}" > ~/debug
	cd "$srcdir/${_gitname}"
	export PYTHONHASHSEED=0
	python setup.py install --prefix=/usr --root="$pkgdir/" --optimize=1 --skip-build

	install -Dm644 LICENSE.md -t "$pkgdir/usr/share/licenses/${pkgname%-git}"
}

#vim: syntax=sh
