# Maintainer: Anthony Wang <ta180m@pm.me>
# Contributor: Tommy Li <ttoo74@gmail.com>

pkgname=python-certipy
_name=${pkgname#python-}
pkgver=0.1.3
pkgrel=2
pkgdesc="A simple python tool for creating certificate authorities and certificates on the fly"
arch=(any)
url="https://github.com/LLNL/certipy"
license=('BSD')
depends=("python" "python-pyopenssl")
makedepends=("python-pypandoc" "python-setuptools")
checkdepends=()
optdepends=()
options=()
source=("https://files.pythonhosted.org/packages/source/${_name::1}/${_name}/${_name}-${pkgver}.tar.gz")
sha256sums=('695704b7716b033375c9a1324d0d30f27110a28895c40151a90ec07ff1032859')

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

