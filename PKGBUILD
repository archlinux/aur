# Maintainer: Alfonso Saavedra "Son Link" <sonlink.dourden@gmail.com>
pkgname=cdtray
_gitname="CD-Tray"
pkgver=2.0.rc1
pkgrel=1
pkgdesc="Play your audio CDs directly from the system tray"
arch=(any)
url="https://github.com/son-link/CD-Tray"
license=('GPL3')
groups=()
depends=('python-pyqt5' 'gstreamer' 'gst-plugins-base' 'python-psutil' 'gst-python')
makedepends=('python-setuptools')
source=("${url}/archive/refs/tags/v.${pkgver}.tar.gz")
sha512sums=('26c4bc9da18260c5600b7b5517c0672ae148f49f7adfcd7e1058980986ae359d5ed757f8e3379b0bc94fc64ac02dced0835167dac98267a76fd4fb2812c3fea2')

build() {
	cd "${srcdir}/${_gitname}-v.${pkgver}"
 	python setup.py build
}

package() {
	cd "${srcdir}/${_gitname}-v.${pkgver}"
  	python setup.py install --root="$pkgdir" --optimize=1 --skip-build
	install -Dm644 "bin/io.sonlink.cdtray.desktop" "$pkgdir/usr/share/applications/$pkgname.desktop"
	install -Dm644 "bin/io.sonlink.cdtray.svg" "$pkgdir/usr/share/pixmaps/$pkgname.svg"
}
