# Maintainer: Lubosz Sarnecki <lubosz@gmail.com>

pkgname=novelwriter-git
_pkgname=novelWriter
pkgver=v1.4.1.r3.gc6973043
pkgrel=1
epoch=1
pkgdesc="Markdown-like text editor designed for writing novels and larger projects of many smaller plain text documents"
arch=(any)
url="https://github.com/vkbo/novelWriter"
license=(GPL3)
makedepends=('python-lxml' 'python-pyqt5' 'python-pypandoc' 'python-latexcodec' 'git')
depends=('python')
optdepends=('python-pyenchant')
source=('git+https://github.com/vkbo/novelWriter.git')
sha256sums=('SKIP')

pkgver() {
	cd ${_pkgname}
	git describe --long | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
	cd ${_pkgname}
	python setup.py build
}

package() {
	cd ${_pkgname}
	python setup.py install --root=${pkgdir}/ --optimize=1

	mkdir -p ${pkgdir}/usr/share/pixmaps
	install -m0644 nw/assets/icons/novelwriter.svg ${pkgdir}/usr/share/pixmaps/novelwriter.svg

	mkdir -p ${pkgdir}/usr/share/applications
	install -m0644 ${startdir}/novelwriter.desktop ${pkgdir}/usr/share/applications/novelwriter.desktop
}
