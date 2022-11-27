# Maintainer: BrainDamage

pkgname=python-tulir-telethon
pkgver=1.27.0a1
pkgrel=1
pkgdesc="is a fork of Telethon library with custom patches from Tulir."
arch=('any')
url="https://github.com/tulir/Telethon"
license=('MIT')
depends=('python-pyaes' 'python-rsa')
provides=('python-telethon')
conflicts=('python-telethon')
optdepends=('python-cryptg' 'python-pysocks' 'python-hachoir' 'python-pillow')

sha256sums=('b400406385254f230ad5969f2056b07a08c102d727ab71cc35b1352fa59a4f71')

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
