# Maintainer: SZanko, szanko at protonmail dot com

_pkgname=shtab
pkgname=python-${_pkgname}
pkgver=1.3.5
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
source=("https://files.pythonhosted.org/packages/ae/b8/d80ecc4cd8d3ac5d776aea4c59c93faff5f3a8c1bc9370c0966708599731/${_pkgname}-${pkgver}.tar.gz")
sha256sums=('3e7880f2778b659f4f01af07ab7b815b2786c257efa8ec52d6057e06a398a103')

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
