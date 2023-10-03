# Maintainer: Raffaele Mancuso <https://aur.archlinux.org/account/raffaem>

_pkgname=nbstata
pkgname=python-${_pkgname}
pkgver=0.6.7
pkgrel=1
pkgdesc="A Jupyter kernel for Stata built on pystata"
arch=('any')
url='https://github.com/hugetim/nbstata'
license=('GPL3')
depends=(python ncurses5-compat-libs python-jupyter-client ipython python-ipykernel python-packaging python-pandas python-numpy python-beautifulsoup4 python-fastcore 'python-pygments>=2.8' python-ipydatagrid-git)
makedepends=(python-setuptools)
source=("$pkgname-$pkgver.tar.gz::https://github.com/hugetim/nbstata/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('fbebba9b98ceab02ba2ea19fdedf0adca5160776b5561d5c3e45a0c9ec484f03')

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
	# we need to specify the /usr subfolder to nbstata's install script
	# creates config file /usr/etc/nbstata.conf if ti doesn't already exist
	python -m nbstata.install --prefix "${pkgdir}/usr" --conf-file
}
