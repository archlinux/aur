# Maintainer: BigfootACA <bigfoot@classfun.cn>

_pyname=openstackdocstheme
pkgname=python-$_pyname
pkgver=2.2.7
pkgrel=2
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
source=(
	https://pypi.io/packages/source/${_pyname::1}/$_pyname/$_pyname-$pkgver.tar.gz
	0000-openstackdocstheme-sphinx-4.0.0.patch
)
md5sums=('ae3515ee8f0d46e60df950aa558b387b'
         '746d48201c3dfead69c1b4afebd75965')
sha256sums=('beacfc00277337c733c1e48ace1cdeb598faf5718609b638972d72fe04bf6372'
            '64b4183f3f69f60b17da2220782169c7cc0ff6146163209d7cc78def5c9db581')
sha512sums=('38ca434d48c04608a66d05a93a19d030bf9302f024d052f67af21e241365f046e9508359dfb62cd1b8897836f20a4983cdeb3c1a66ca4e3161fd722da6006332'
            '2addf86f0d2365aa0ff8a94d5cb356041bb7c5bdc4b9921d0dc3d5fba52de005c7b95dc90224ec0c245e3cfd857ba9024d301ed4177d0c1f0f4dbf0f70c138f9')

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
