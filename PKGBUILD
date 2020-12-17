# Maintainer: Mark Wagie <mark dot wagie at tutanota dot com>
pkgname=guiscrcpy
pkgver=4.7.7
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
_commit=baf4cbdfde237d66eca7c1f1852c5e6d38e947b3  # tags/v4.7.7^0
source=("git+https://github.com/srevinsaju/guiscrcpy.git#commit=$_commit?signed")
sha256sums=('SKIP')
validpgpkeys=('7427D25413635E1E39657B6B1007816766D390D7')
              # Srevin Saju (srevinsaju) <srevinsaju@sugarlabs.org>

prepare() {
	cd "$srcdir/$pkgname"
	git describe --tags | sed 's/^v//;s/-/+/g'
}

build() {
	cd "$srcdir/$pkgname"
	python setup.py build
}

package() {
	cd "$srcdir/$pkgname"
	export PYTHONHASHSEED=0
	python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
}
