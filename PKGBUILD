# Maintainer: Jan Koppe <post-aur $ jankoppe.de>
# Contributor: Andrew Sun <adsun701 at gmail dot com>
# Contributor: Alex Zose <alexander[dot]zosimidis[at]gmail[dot]com>

pkgname=python-crudini
_name=${pkgname#python-}
pkgver=0.9.4
pkgrel=1
pkgdesc="A utility for manipulating ini files"
arch=('any')
url="https://www.pixelbeat.org/programs/crudini/"
license=('GPL2')
depends=(python-iniparse)
provides=(crudini)
makedepends=(python-build python-installer python-wheel)
conflicts=(crudini)
source=("${_name}-${pkgver}"::"https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
b2sums=('7bd01e112bf9f28569be53cfc35ed85bb935afa7e3742d727ee4aa64e43313a10d229819b5a4aea219e224da16d96d6e1f1eb7701797ba214ad389a64aae0d04')

build(){
  cd "${srcdir}/${_name}-${pkgver}"
  python -m build --wheel --no-isolation
}

package() {
  cd "${srcdir}/${_name}-${pkgver}"
  #pip install --prefix=/usr --root="${pkgdir}" --optimize=1 --skip-build
  python -m installer --destdir="$pkgdir" dist/*.whl
}
