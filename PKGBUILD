# Maintainer: AtticFinder65536 <atticfinder -AT- rocklabs -DOT- xyz>

pkgname=('python-fugashi')
_name=${pkgname#python-}
pkgver=1.2.1
pkgrel=3
pkgdesc="Cython MeCab wrapper for fast, pythonic Japanese tokenization and morphological analysis"
url="https://github.com/polm/fugashi"
license=('MIT')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
b2sums=('4f9f9316831e05e910085e1eff9cd2ef3743443b6f93cb5e9c94a901090e58b04d4d3f863c0394239f484ab62eb0f88a9f457ea9696561cf2f7f12cdfd48716a')
arch=('any')
depends=('python' 'cython' 'mecab')
makedepends=('python-setuptools' 'python-wheel' 'python-setuptools-scm')
optdepends=('python-unidic: Use the latest version of UniDic, large install size'
            'python-unidic-lite: Use a lite version of UniDic')
checkdepends=('python-pytest' 'python-ipadic' 'mecab-ipadic' 'python-unidic-lite')
install=python-fugashi.install

build(){
	cd "${_name}-${pkgver}"
	python setup.py build
}

check(){
	cd "${_name}-${pkgver}"
	local python_version=$(python -c 'import sys; print("".join(map(str, sys.version_info[:2])))')
	PYTHONPATH="$PWD/build/lib.linux-$CARCH-cpython-${python_version}" pytest
}

package(){
	cd "${_name}-${pkgver}"
	python setup.py install --root="$pkgdir" --optimize=1 --skip-build
	install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
