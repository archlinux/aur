# Maintainer: BigfootACA <bigfoot@classfun.cn>

_pyname=os-api-ref
pkgname=python-$_pyname
pkgver=2.3.0
pkgrel=1
pkgdesc="Sphinx Extensions to support API reference sites in OpenStack"
arch=(any)
url="https://docs.openstack.org/os-api-ref/latest/"
license=(Apache)
depends=(
	python
	python-pbr
	python-pyaml
	python-six
	python-sphinx
	python-openstackdocstheme
)
checkdepends=(
	python-hacking
	python-coverage
	python-subunit
	python-testrepository
	python-testtools
	python-sphinx-testing
	python-beautifulsoup4
	python-stestr
)
makedepends=(
	python
	python-setuptools
)
source=(https://pypi.io/packages/source/${_pyname::1}/$_pyname/$_pyname-$pkgver.tar.gz)
md5sums=('590babb33e01586be90e95e81666abff')
sha256sums=('5d799d4073743063d9f07b8fb154e5714f1b671c994114deeb5cb40bd05b97f3')
sha512sums=('e53063df90393c17e764e640c4ad5e1e6f1da7286ce9da6bdd460d54e2f831022a366c9cb711b95d8bfa872294309620f2d44cd4910277971ff2f2719c5d81eb')

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
