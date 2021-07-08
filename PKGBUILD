# Maintainer: SZanko, szanko at protonmail dot com

_pkgname=shtab
pkgname=python-${_pkgname}
pkgver=1.3.8
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
source=("https://files.pythonhosted.org/packages/76/1f/364e618bd38098c5d1116cbb5c520f620ba28051449d7b39d550c8da3e3e/${_pkgname}-${pkgver}.tar.gz")
sha256sums=('692c6fcd69dd88aca7c36605de9904936fb8fd4b6050b540ab22111aae7a9111')

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
