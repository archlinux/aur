# Maintainer: Alfonso Saavedra "Son Link" <sonlink.dourden@gmail.com>
pkgname=cdtray
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
sha512sums=('151eeb7828fe4eed7feebb6c634e2b8c')

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
