# Maintainer: Tommy Li <ttoo74@gmail.com>
pkgname=python-certipy
_name=${pkgname#python-}
pkgver=0.1.2
pkgrel=1
pkgdesc="A simple python tool for creating certificate authorities and certificates on the fly"
arch=(any)
url="https://github.com/LLNL/certipy"
license=('BSD')
depends=("python" "python-pyopenssl")
makedepends=("python-pypandoc")
checkdepends=()
optdepends=()
options=()
source=("https://files.pythonhosted.org/packages/source/${_name::1}/${_name}/${_name}-${pkgver}.tar.gz")
sha256sums=('3461c5ff28eda977185132d4c6d4393989c7dd996ba8c780b07b9b4e679d455a')

prepare() {
	# fix permission error
	chmod -R u+rwX,go+rX,go-w "$_name-$pkgver"
}

build() {
	cd "$_name-$pkgver"
	python setup.py build
}

package() {
	cd "$_name-$pkgver"
	python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
}

