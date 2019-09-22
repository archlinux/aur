# Maintainer: Mark Wagie <yochanan dot marqos at gmail dot com>
pkgname=guiscrcpy-git
pkgver=v1.11.r1.4c39ba3
pkgrel=1
pkgdesc="A full fledged GUI integration for the most award winning open-source Android screen mirroring system -- scrcpy"
arch=('i686' 'x86_64')
url="https://srevinsaju.github.io/guiscrcpy"
license=('GPL3')
depends=('scrcpy' 'python-pyqt5' 'python-psutil' 'python-qdarkstyle')
makedepends=('git' 'python-setuptools')
optdepends=('wmctrl: to use development toolkit'
            'xdotool: to use development toolkit')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=('git+https://github.com/srevinsaju/guiscrcpy.git'
        "${pkgname%-git}.desktop"
        "${pkgname%-git}.sh")
sha256sums=('SKIP'
            '11d0720e3b4675be95a26e0583cb4bb0ee79ab6f48df4a2df21a2b0917737448'
            '7d85c9d18ee989efa9cec44924294a5775c00a0d1ca6c369fb43a216e1d6f19f')

pkgver() {
	cd "$srcdir/${pkgname%-git}"
	printf "%s" "$(git describe --long --tags | sed 's/\([^-]*-\)g/r\1/;s/-/./g')"
}

build() {
	cd "$srcdir/${pkgname%-git}"
	python setup.py build
}

package() {
	cd "$srcdir/${pkgname%-git}"
	python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
	install -Dm755 "$srcdir/${pkgname%-git}.sh" "$pkgdir/usr/bin/${pkgname%-git}"
	install -Dm644 "$srcdir/${pkgname%-git}.desktop" "$pkgdir/usr/share/applications/${pkgname%-git}.desktop"
}
