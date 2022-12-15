# Maintainer: Lubosz Sarnecki <lubosz@gmail.com>

pkgname=novelwriter-git
_pkgname=novelWriter
pkgver=2.0.2.r0.g66cc3777
pkgrel=1
epoch=1
pkgdesc="Markdown-like text editor designed for writing novels and larger projects of many smaller plain text documents"
arch=(any)
url="https://github.com/vkbo/novelWriter"
license=(GPL3)
makedepends=('python-lxml' 'python-pyqt5' 'python-pypandoc' 'python-latexcodec' 'git' 'python-setuptools')
depends=('python')
optdepends=('python-pyenchant')
source=('git+https://github.com/vkbo/novelWriter.git')
sha256sums=('SKIP')

pkgver() {
	cd ${_pkgname}
	git describe --long | sed 's/\([^-]*-g\)/r\1/;s/-/./g' | cut -c2-48
}

build() {
	cd ${_pkgname}
	python setup.py build
}

package() {
	cd ${_pkgname}
	python setup.py install --root=${pkgdir}/ --optimize=1

	mkdir -p ${pkgdir}/usr/share/pixmaps
	install -m0644 ${srcdir}/${_pkgname}/novelwriter/assets/icons/novelwriter.svg ${pkgdir}/usr/share/pixmaps/novelwriter.svg

	mkdir -p ${pkgdir}/usr/share/applications
	install -m0644 ${startdir}/novelwriter.desktop ${pkgdir}/usr/share/applications/novelwriter.desktop
}
