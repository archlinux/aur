# Maintainer: gkmcd <g at dramati dot cc>

# Keywords: cli shell interactive framework

pkgname="python-nubia-git"
_name="python-nubia"
pkgver="r6.5a659f1"
pkgrel=1
pkgdesc="A framework for building beautiful shells."
arch=('any')
url="https://github.com/facebookincubator/python-nubia"
license=('BSD')
depends=('python' 'python-termcolor' 'python-levenshtein' 'python-pyparsing' 'python-prettytable' 'python-prompt_toolkit' 'python-pygments')
makedepends=('git' 'python-setuptools' 'python-pipenv' 'python-wheel')
checkdepends=('python-nose')
optdepends=()
provides=("python-nubia")
conflicts=("python-nubia")
source=('git+https://github.com/facebookincubator/python-nubia.git')
md5sums=('SKIP')

pkgver() {
	cd "${srcdir}/${_name}"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	cd "${srcdir}/${_name}"
	python setup.py build
}

check() {
	cd "${srcdir}/${_name}"
	nosetests
}

package() {
	cd "${srcdir}/${_name}"
	python setup.py install --root="${pkgdir}" --skip-build
	install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
