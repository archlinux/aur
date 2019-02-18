# Maintainer: hcra <hcra at u53r dot space>

pkgname=qweborf-git
_pkgname="weborf"
pkgver=0.15
pkgrel=2
pkgdesc="Minimal HTTP server to share your files - Qt frontend"
arch=(any)
url='https://ltworf.github.io/weborf/'
license=(GPL3)
depends=('python' 'python-pyqt5' 'weborf-git')
makedepends=('pacman>=5.1' 'git' 'sudo' 'python-pyqt5')
conflicts=('weborf')
source=("git+https://github.com/ltworf/weborf.git#branch=master")
md5sums=("SKIP")

pkgver() {
	cd "$srcdir/$_pkgname"
	git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
	cd "$srcdir/$_pkgname-${pkgver}"
	pyuic5 qweborf/main.ui > qweborf/main.py
	python qweborf.setup.py build
}

package() {
	cd "$srcdir/$_pkgname-${pkgver}"
	python qweborf.setup.py install --root="$pkgdir"
	install -Dm 0755 qweborf/qweborf "$pkgdir/usr/bin/qweborf"
	install -Dm 0755 qweborf/qweborf.desktop "$pkgdir/usr/share/applications/qweborf.desktop"
}
