# Maintainer: Mark Wagie <mark dot wagie at tutanota dot com>
pkgname=guiscrcpy-git
pkgver=4.7.3.r1153.g8298cae
pkgrel=1
pkgdesc="Open Source GUI based Android Screen Mirroring System"
arch=('any')
url="https://guiscrcpy.github.io"
license=('GPL3')
depends=('scrcpy' 'python-pynput' 'python-qtpy' 'python-psutil'
         'python-cairosvg' 'python-click' 'python-colorama' 'libxinerama')
makedepends=('git' 'python-setuptools' 'python-pyqt5')
optdepends=('python-pyqt5: Qt5 Python bindings'
            'pyside2: PySide Qt5 Python bindings'
            'usbaudio: AOA audio, deprecated since Android 8.0')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=('git+https://github.com/srevinsaju/guiscrcpy.git')
sha256sums=('SKIP')

pkgver() {
	cd "$srcdir/${pkgname%-git}"
#	git describe --long --tags --match "[0-9]*" | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
#	git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
	printf "%s.r%s.g%s" "$(grep -oP "(?<=version=\"v).*(?=\")" setup.py)" \
		"$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	cd "$srcdir/${pkgname%-git}"
	python setup.py build
}

package() {
	cd "$srcdir/${pkgname%-git}"
	python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
}
