# Maintainer: SZanko, szanko at protonmail dot com

_pkgname=shtab
pkgname=python-${_pkgname}
pkgver=1.4.2
pkgrel=1
pkgdesc="Automagic shell tab completion for Python CLI applications"
arch=('any')
url="https://github.com/iterative/shtab"
license=('Apache')
depends=(
	'python'
	'python-setuptools'
	'python-pip'
	)

source=("${_pkgname}-${pkgver}.tar.gz"::"https://pypi.python.org/packages/source/${_pkgname:0:1}/${_pkgname/-/_}/${_pkgname/-/_}-${pkgver}.tar.gz")
sha256sums=('a11f296bf149df2c1cc781941e485191298ad1b745dc11d01cb226c555aff7cb')

build() {
	cd "${srcdir}/${_pkgname}-${pkgver}"
	mv LICENCE LICENSE
	rm -rf tests
	python setup.py build
}

package() {
    cd "$srcdir/$_pkgname-$pkgver"
    python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
    install -Dm644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
