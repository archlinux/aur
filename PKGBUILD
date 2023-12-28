# Maintainer: Fabrice Mouhartem <aur-packages@epheme.re>
#
# Inspired by fanficfare-git's PKGBUILD
# (https://aur.archlinux.org/packages/fanficfare-git)
_pkgname=kalamine
pkgname=kalamine-git
pkgver=r75.56b4e79
pkgrel=1
pkgdesc="A text-based, cross-platform Keyboard Layout Maker."
arch=('any')
url="https://github.com/fabi1cazenave/${_pkgname}"
license=('MIT')
groups=()
deps=(
        'click',
        'pyyaml',
        'setuptools',
        'tomli',
        'lxml',
)
depends=("${_deps[@]/#/python-}")
makedepends=('git')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
install=
source=("git+${url}.git")
md5sums=('SKIP')

pkgver() {
	cd "$srcdir/${_pkgname}"

	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	cd "$srcdir/${_pkgname}"

	python setup.py build
}

package() {
	cd "$srcdir/${_pkgname}"

	python setup.py install --root="$pkgdir" --optimize=1
}
