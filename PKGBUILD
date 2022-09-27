# Maintainer: BrainDamage

pkgname=python-tulir-telethon
pkgver=1.26.0a5
pkgrel=1
pkgdesc="is a fork of Telethon library with custom patches from Tulir."
arch=('any')
url="https://github.com/tulir/Telethon"
license=('MIT')
depends=('python-pyaes' 'python-rsa')
provides=('python-telethon')
conflicts=('python-telethon')
optdepends=('python-cryptg' 'python-pysocks' 'python-hachoir' 'python-pillow')

sha256sums=('b3aa63f641ea725e97535290fda3b0d57590dc2c83a2d6839749bb6a3f526d6e')

_dirname="${pkgname#python-}-${pkgver}"
_basename="${pkgname#python-}"

# template start; name=pythonhosted; version=1;
source=("https://files.pythonhosted.org/packages/source/${_basename::1}/${_basename}/${_basename}-${pkgver}.tar.gz")
# template end;

# template start; name=python; version=1;
depends+=('python')
makedepends+=('python-setuptools')

build() {
	cd "${srcdir}/${_dirname}"
	export PYTHONHASHSEED=0
	python setup.py build
}

package() {
	cd "${srcdir}/${_dirname}"
	python setup.py install --optimize=1 --skip-build --root="${pkgdir}/" --prefix="/usr"
	# not necessary for every package, but for those who it is, it'd generate conflict with others otherwise
	rm -rf "${pkgdir}/$(python -c 'import site; print(site.getsitepackages()[0])')/tests/"
}
# template end;
