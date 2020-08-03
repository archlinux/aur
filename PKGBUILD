# Maintainer: Clint Valentine <valentine.clint@gmail.com>

_name=adjustText
pkgname='python-adjusttext'
pkgver=0.7.3
pkgrel=1
pkgdesc='Iteratively adjust text position in matplotlib plots to minimize overlaps'
arch=(any)
url="https://github.com/Phlya/$_name"
license=(MIT)
depends=(python python-matplotlib python-numpy)
makedepends=(python-setuptools)
options=(!emptydirs)
source=(
	"$pkgname-$pkgver.tar.gz::https://pypi.io/packages/source/${_name:0:1}/$_name/$_name-$pkgver.tar.gz"
	"https://raw.githubusercontent.com/Phlya/$_name/$pkgver/LICENSE"
)
sha256sums=('b90e275a95b4d980cbbac7967914b8d66477c09bc346a0b3c9e2125bba664b06'
            '443687f058d5f541952ab9bcd6f836d9843ac13b93b8a6b1097eb0832d2314fa')

prepare() {
	cp -a "${_name}"-"${pkgver}"{,-py2}
}

build() {
	cd "${srcdir}"/"${_name}"-"${pkgver}"
	python setup.py build
}

package_python-adjusttext() {
	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
	cd "$_name-$pkgver"
	python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
}
