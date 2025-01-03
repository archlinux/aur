# Maintainer: Maks Verver <maks@verver.ch>
# Contributor: BigfootACA <bigfoot@classfun.cn>

_name=zstd
pkgname=python-$_name
pkgver=1.5.6.1
pkgrel=1
pkgdesc="ZSTD Bindings for Python"
arch=(x86_64 i686 arm armv6h armv7h aarch64)
url="https://github.com/sergey-dryabzhinsky/python-zstd"
license=(BSD)
depends=(python)
makedepends=(python-setuptools)
checkdepends=(python-pytest)
source=(https://pypi.io/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz)
md5sums=('6b038999f4afa5c442bc125db1196dea')
sha256sums=('64a01e79d8d9592cd35f9de2ebc0376e0f94dc8150d6e3ae891a55f190d3490e')

build() {
	cd $_name-$pkgver
	python setup.py build
}

check() {
	cd $_name-$pkgver
	PYTHONPATH="$(realpath build/lib.linux-*)" python -m pytest
}

package() {
	cd $_name-$pkgver
	python setup.py install --root "$pkgdir" --optimize=1
	install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
