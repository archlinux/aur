# Maintainer: Marcelo Galvan <marcelo_galvan at protonmail dot com>

pkgname='zennin'
pkgver='1.1.0'
pkgrel=1
pkgdesc="Print quotes on your terminal."
arch=(any)
url="https://github.com/Erymer/zennin"
license=(GPL3)
depends=('python')
makedepends=(
	'python-build'
	'python-installer'
	'python-wheel'
  'python-pytest'
)
checkdepends=(
	'python-pytest'
)
provides=('zennin')
conflicts=('zennin')
source=("$pkgname-$pkgver.tar.gz::https://github.com/Erymer/zennin/archive/refs/tags/v$pkgver.tar.gz")
b2sums=('f225c829325eed7627d1a0f8519fc9e46a6f61e3e26c4e7d937c869cffbc69f6c65356b712022fdbbf2f08192038690af7a5d40c2c35a38674a5a3ad79ad6d4b')

build() {
	cd "$pkgname-$pkgver"
	python -m build -wn
}

check() {
	cd "$pkgname-$pkgver"
  python -m pytest
}

package() {
	cd "${pkgname}-${pkgver}"
	python -m installer -d "${pkgdir}" dist/*.whl
  install -vDm644 doc/quotebook.txt "${pkgdir}/usr/share/doc/${pkgname}/quotebook.txt"
  install -vDm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
