# Maintainer: BigfootACA <bigfoot@classfun.cn>

_pyname=openstackdocstheme
pkgname=python-$_pyname
pkgver=3.0.0
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
md5sums=('1e13b4214bb424d89e2d0b563bbbccda')
sha256sums=('72c6d4f9a9b6397a78c49eb43f80a9da2ed30b3f8f9d183704271cf7e3f23ccf')
sha512sums=('0e4c5ca3f43e701692bb56d4e0823b52c55c49e9b4144d3920830903e178522f414930c0a253be415cd6d08534205f2d8e8fac107513bc32d1f667e8559a8c2f')

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
