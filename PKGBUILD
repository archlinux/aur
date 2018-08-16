# Maintainer: Alexander Seiler <seileralex@gmail.com>

pkgname=python-halo
_name=${pkgname#python-}
pkgver=0.0.16
pkgrel=1
pkgdesc="Beautiful terminal spinners in Python"
arch=('any')
url="https://github.com/manrajgrover/${_name}"
license=('MIT')
depends=('python' 'python-log_symbols' 'python-spinners' 'python-cursor' 'python-termcolor' 'python-six')
makedepends=('python-setuptools')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/${_name}/${_name}-${pkgver}.tar.gz" "shutil.patch")
sha256sums=('5dab3e6ce10b388e91a5627622f7695c487eeb571b55a758c2999e62b173fa62' '53b7ac66f285e2abc4e1bf427c84ffce59b3c2b0a024230528759684ca012167')

prepare() {
	cd "$_name-$pkgver"
	patch -Np1 -i "${srcdir}/shutil.patch"
}

build() {
	cd "$_name-$pkgver"
	python setup.py build
}

package() {
	cd "$_name-$pkgver"
	python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
}
