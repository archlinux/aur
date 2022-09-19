# Maintainer: BigfootACA <bigfoot@classfun.cn>

_pyname=zstd
pkgbase=python-$_pyname
pkgname=(python-$_pyname)
pkgver=1.5.2.6
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
md5sums=('e71055ba422b1c3aeeb4c7257375743b')
sha256sums=('f440858d198890e5ff517dff32d15e8c31bb73506a896f9baf6d014efe62f7fc')
sha512sums=('a692d87ffad4d148d56487fa740876653ccbd151ac8a897a35946a3899d4d3b3aaf6e9954a2050b4cee8137d5161481f3460a0e64ce339c624349bf030c9f975')

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
