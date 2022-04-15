# Maintainer: SZanko, szanko at protonmail dot com

_pkgname=samloader
pkgname=${_pkgname}-git
pkgver=r39.576bd29
pkgrel=1
pkgdesc="Download firmware for Samsung devices"
arch=('any')
url="https://github.com/nlscc/samloader"
license=('GPL3')
conflicts=('samloader')
depends=(
	'python'
	'python-setuptools'
	'python-tqdm'
	'python-pycryptodomex'
	'python-pip'
	)
source=(git+"${url}.git")
sha256sums=('SKIP')

pkgver() {
	cd "$_pkgname"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	cd "${srcdir}/${_pkgname}"
	python setup.py build
}

package() {
    cd "$srcdir/$_pkgname"
    python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
}
