# Maintainer: Philip Goto <philip.goto@gmail.com>

_pkgname=polyscope
pkgname=python-${_pkgname}
pkgver=0.1.7
pkgrel=1
pkgdesc="Python viewer and user interface for 3D data, like meshes and point clouds"
url="https://polyscope.run/py/"
license=(MIT)
arch=(x86_64 aarch64)
depends=(gcc-libs libx11)
makedepends=(
	cmake
	libglvnd
	libxi
	libxcursor
	libxinerama
	libxrandr
	python-setuptools
)
source=("https://files.pythonhosted.org/packages/source/${_pkgname::1}/${_pkgname}/${_pkgname}-${pkgver}.tar.gz")
sha256sums=('d49ce408b0947181ecd3d5652ecaf8e25fa2abd681deef74fc12d8c7fc3c7fb7')

build(){
	cd "polyscope-${pkgver}"
	python setup.py build
}

package(){
	cd "polyscope-${pkgver}"
	python setup.py install --skip-build --root="$pkgdir" --optimize=1
	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
