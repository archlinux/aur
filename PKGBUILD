# Maintainer: Bruce Zhang <zttt183525594 [at] gmail [dot] com>
pkgname=fastocr-git
pkgver=0.1.2.r12.ca19e1b
pkgrel=1
pkgdesc='FastOCR is a desktop application for OCR API.'
arch=('any')
url='https://github.com/BruceZhang1993/FastOCR'
license=('LGPL3')
depends=('python-pyqt5' 'python-qasync' 'python-aiohttp' 'python-dbus' 'python-click')
makedepends=('git' 'python-setuptools') # 'bzr', 'git', 'mercurial' or 'subversion'
provides=('fastocr')
source=('fastocr::git+https://github.com/BruceZhang1993/FastOCR')
sha256sums=('SKIP')

pkgver() {
	cd "$srcdir/fastocr"
	printf "%s" "$(git describe --long | sed 's/\([^-]*-\)g/r\1/;s/-/./g')"
}

build() {
	cd "$srcdir/fastocr"
	python setup.py build
}

package() {
	cd "$srcdir/fastocr"
	python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
	install -Dm644 fastocr/data/FastOCR.desktop "$pkgdir/usr/share/applications/FastOCR.desktop"
}
