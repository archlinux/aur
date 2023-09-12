# Maintainer: Raffaele Mancuso <https://aur.archlinux.org/account/raffaem>

_pkgname=nbstata
pkgname=python-${_pkgname}
pkgver=0.6.6
pkgrel=1
pkgdesc="A Jupyter kernel for Stata built on pystata"
arch=('any')
url='https://github.com/hugetim/nbstata'
license=('GPL3')
depends=(python ncurses5-compat-libs python-jupyter-client ipython python-ipykernel python-packaging python-pandas python-numpy python-beautifulsoup4 python-fastcore 'python-pygments>=2.8' python-ipydatagrid-git)
makedepends=(python-setuptools)
source=("$pkgname-$pkgver.tar.gz::https://github.com/hugetim/nbstata/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('a180ee8292915b3dc4a4884a386e9af5e5006aecf98bdb174395c3347db59928')

build() {
  cd "${_pkgname}-${pkgver}"
  python setup.py build
}

check() {
  cd "${_pkgname}-${pkgver}"
  #python setup.py test
}

package() {
  cd "${_pkgname}-${pkgver}"
  # setuptools automatically install in /usr subfolder
  python setup.py install --optimize=1 --root="${pkgdir}"
  # install Jupyter kernel
  # we need to specify the /usr subfolder nbstata.install
  python -m nbstata.install --prefix "${pkgdir}/usr" --conf-file
}
