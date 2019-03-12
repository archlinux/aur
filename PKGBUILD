# Maintainer: hcra <hcra at u53r dot space>

pkgname=qweborf-git
_pkgname="weborf"
pkgver=0.15
pkgrel=10
pkgdesc="Minimal HTTP server to share your files - Qt frontend"
arch=(any)
url="https://ltworf.github.io/weborf"
license=('GPL3')
depends=('python' 'python-pyqt5' 'weborf-git' 'desktop-file-utils')
makedepends=('pacman>=5.1' 'git' 'sudo' 'python-setuptools')
conflicts=('qweborf-git')
source=("git+https://github.com/ltworf/weborf.git#branch=master")
md5sums=("SKIP")

pkgver() {
	cd "$srcdir/$_pkgname"

	git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
	cd "$srcdir/$_pkgname"

	pyuic5 qweborf/qweborf/main.ui > qweborf/main.py
	python qweborf/setup.py build
}

package() {
	cd "$srcdir/$_pkgname"

	python qweborf/setup.py install --root="$pkgdir" --optimize=1 --skip-build
	install -Dm 0755 qweborf/qweborf/qweborf "$pkgdir/usr/bin/qweborf"
	install -Dm 0755 qweborf/integration/qweborf.desktop "$pkgdir/usr/share/applications/qweborf.desktop"
}
