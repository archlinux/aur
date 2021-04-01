# Maintainer: Richard Neumann aka. schard <mail at richard dash neumann period de>
_pkgbase=admbrowser
pkgname="${_pkgbase}-git"
provides=("${_pkgbase}")
pkgver=r155.da7b945
pkgrel=1
pkgdesc="A web browser for kiosk systems."
arch=('any')
url="https://github.com/alandmoore/admbrowser"
license=("GPL3")
makedepends=('git')
depends=('python-pyqt5' 'python-pyqt5-webengine' 'python-setuptools' 'python-yaml' 'qt5-webkit')
source=("git+${url}")
md5sums=('SKIP')
backup=("etc/admbrowser.yaml")


pkgver() {
	cd "${srcdir}"/"${_pkgbase}"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}


build() {
	cd "${srcdir}/${_pkgbase}"
	python setup.py build
}


package(){
	cd "${srcdir}"/"${_pkgbase}"
	python setup.py install --root "${pkgdir}" --optimize=1 --skip-build
	install -dm755 "${pkgdir}"/usr/share/doc/"${_pkgbase}"/examples
	install -D -m644 admbrowser.yaml "${pkgdir}"/etc/admbrowser.yaml
	install -D -m644 README.rst "${pkgdir}"/usr/share/doc/"${_pkgbase}"/README.rst
	install -m644 examples/* "${pkgdir}"/usr/share/doc/"${_pkgbase}"/examples/
}
