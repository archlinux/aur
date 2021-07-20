# Maintainer: SZanko, szanko at protonmail dot com

_pkgname=shtab
pkgname=python-${_pkgname}
pkgver=1.3.9
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

source=("https://files.pythonhosted.org/packages/76/4c/4145b52bce6d442ef151a838c478217685cc9ee0d43e56cc2fb59a6cd071/${_pkgname}-${pkgver}.tar.gz")
sha256sums=('3d99abe5398c73c94644d4cbefb4bf44a145d0b8440e902b0d9dc02bff653543')

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
