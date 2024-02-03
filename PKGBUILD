# Maintainer: BigfootACA <bigfoot@classfun.cn>

_pyname=zstd
pkgbase=python-$_pyname
pkgname=(python-$_pyname)
pkgver=1.5.5.1
pkgrel=1
pkgdesc="ZSTD Bindings for Python"
arch=(x86_64 i686 arm armv6h armv7h aarch64)
url="https://github.com/sergey-dryabzhinsky/python-zstd"
license=(BSD)
makedepends=(
	zstd
	python
	python-setuptools
)
checkdepends=(
	python-pytest
)
source=(https://pypi.io/packages/source/${_pyname::1}/$_pyname/$_pyname-$pkgver.tar.gz)
md5sums=('479b302e5e269ced1efadad51dc3b399')
sha256sums=('1ef980abf0e1e072b028d2d76ef95b476632651c96225cf30b619c6eef625672')

build(){
	pushd $_pyname-$pkgver
	python setup.py build
	popd
}

check(){
	pushd $_pyname-$pkgver
	PYTHONPATH="$(realpath build/lib.linux-*)" python -m pytest
	popd
}

_package_python(){
	depends=(python)
	cd "$_pyname-$pkgver"
	python setup.py install --root "$pkgdir" --optimize=1
	install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}

eval "package_python-${_pyname}(){ _package_python; }"
