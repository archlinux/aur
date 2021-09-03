# Maintainer: BigfootACA <bigfoot@classfun.cn>

_pyname=openstackdocstheme
pkgname=python-$_pyname
pkgver=2.3.0
pkgrel=1
pkgdesc="OpenStack Docs Theme"
arch=(any)
url="https://docs.openstack.org/openstackdocstheme/latest/"
license=(Apache)
depends=(
	python
	python-pbr
	python-dulwich
)
makedepends=(python-setuptools)
checkdepends=(
	python-hacking
	python-sphinx
	python-pre-commit
)
source=(https://pypi.io/packages/source/${_pyname::1}/$_pyname/$_pyname-$pkgver.tar.gz)
md5sums=('afa5e145d3a61bfdb168fd8b2357e744')
sha256sums=('dbdd237e40f660c86a5fe8c3d16db99e2c8471db2d7575981d5a02ce1977cf77')
sha512sums=('26cd9c6c36bf4f707c74556829dcf270eb7e064e4d35ad76931d79f9b0f2aeb0cde37b2ff07f97a010566fed53c55746cd413aa4a03d8718be92810f6afd29f0')

export PBR_VERSION=$pkgver

prepare(){
	for i in "${source[@]}"
	do case "${i}" in
		?*.patch)
			msg2 "Apply patch ${i}"
			patch -Np1 <"${i}"
		;;
	esac
	done
}

build(){
	cd $_pyname-$pkgver
	python setup.py build
}

package(){
	cd $_pyname-$pkgver
	python setup.py install --root "$pkgdir" --optimize=1
	install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
