# Maintainer: Lubosz Sarnecki <lubosz@gmail.com>

pkgname=novelwriter-git
_pkgname=novelWriter
pkgver=0.4.6.850.2fcbcae
_pkgver=0.4.6
pkgrel=1
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
	hash=$(git log --pretty=format:'%h' -n 1)
	revision=$(git rev-list --count HEAD)
	echo ${_pkgver}.${revision}.${hash}
}

build() {
	cd ${_pkgname}
	python setup.py build
}

package() {
	cd ${_pkgname}
	python setup.py install --root=${pkgdir}/ --optimize=1

	mkdir -p ${pkgdir}/usr/share/pixmaps
	/bin/install -m0644 nw/assets/icons/novelWriter.svg ${pkgdir}/usr/share/pixmaps/novelwriter.svg

	mkdir -p ${pkgdir}/usr/share/applications
	/bin/install -m0644 ${startdir}/novelwriter.desktop ${pkgdir}/usr/share/applications/novelwriter.desktop
}
