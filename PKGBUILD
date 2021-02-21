# Maintainer: SZanko szanko at protonmail dot com

_pkgname=shtab
pkgname=python-${_pkgname}
pkgver=1.3.4
pkgrel=4
pkgdesc="Automagic shell tab completion for Python CLI applications"
arch=('any')
url="https://github.com/iterative/shtab"
license=('Apache')
depends=(
	'python'
	'python-setuptools'
	'python-pip'
	)
source=("https://files.pythonhosted.org/packages/99/63/0100420a832f176285f28cef3aa2bd6ef249dd2e66a00601019630c5f4fe/${_pkgname}-${pkgver}.tar.gz")
sha256sums=('353f2a3a5178cd2df8eb746e7ab26a5039a9989e4386de8fd239d8c1653a8887')

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
