# Maintainer: SZanko, szanko at protonmail dot com

_pkgname=shtab
pkgname=python-${_pkgname}
pkgver=1.5.1
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
sha256sums=(
	'49dd9689a1a0492b1e93cc2900fe14e02df89c54b0ce65d033f511fe6b5dd0b9'
)

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
