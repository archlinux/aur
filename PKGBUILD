# Maintainer: Maks Verver <maks@verver.ch>
# Contributor: BigfootACA <bigfoot@classfun.cn>

_name=zstd
pkgname=python-$_name
pkgver=1.5.7.2
pkgrel=1
pkgdesc="ZSTD Bindings for Python"
arch=(x86_64 i686 arm armv6h armv7h aarch64)
url="https://github.com/sergey-dryabzhinsky/python-zstd"
license=(BSD)
depends=(python)
makedepends=(python-setuptools)
checkdepends=(python-pytest)
source=(https://pypi.io/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz)
md5sums=('1b21cc25023175b403fc5bf424f2c818')
sha256sums=('6d8684c69009be49e1b18ec251a5eb0d7e24f93624990a8a124a1da66a92fc8a')

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
