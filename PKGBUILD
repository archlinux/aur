# Maintainer: SZanko, szanko at protonmail dot com

_pkgname=shtab
pkgname=python-${_pkgname}
pkgver=1.3.10
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

source=("https://files.pythonhosted.org/packages/b9/59/9cc20808eec76e0d1db72fb31a3523119e94abf979ad1fe8e2fefc76f849/shtab-1.3.10.tar.gz")
sha256sums=('2740cb128bfd78382ddf300639a1378ef7e4658a562b268b1b52b5c73607c798')

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
