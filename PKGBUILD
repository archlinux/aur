# Maintainer: Lubosz Sarnecki <lubosz@gmail.com>

pkgname=novelwriter-git
_pkgname=novelWriter
pkgver=v1.3rc1.r3.g01576f94
pkgrel=1
epoch=1
pkgdesc="Markdown-like text editor designed for writing novels and larger projects of many smaller plain text documents"
arch=(any)
url="https://github.com/vkbo/novelWriter"
license=(GPL3)
depends=('python-lxml' 'python-pyqt5' 'python-pypandoc' 'python-latexcodec')
optdepends=('python-pyenchant')
makedepends=('git')
source=('git+https://github.com/vkbo/novelWriter.git')
md5sums=('SKIP')

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
	/bin/install -m0644 nw/assets/icons/novelwriter.svg ${pkgdir}/usr/share/pixmaps/novelwriter.svg

	mkdir -p ${pkgdir}/usr/share/applications
	/bin/install -m0644 ${startdir}/novelwriter.desktop ${pkgdir}/usr/share/applications/novelwriter.desktop
}
