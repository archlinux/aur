# Maintainer: Adrian Perez de Castro <aperez@igalia.com>

pkgname=facedetect
pkgdesc='Simple face detector for batch processing'
pkgver=0.1
pkgrel=1
url=https://www.thregr.org/wavexx/software/facedetect/
arch=(x86_64)
license=(GPL-2.0-or-later)
depends=(python-opencv)
makedepends=(python-fissix)
source=("https://gitlab.com/wavexx/facedetect/-/archive/v$pkgver/$pkgname-v$pkgver.tar.bz2")
sha256sums=('828ace5be21e1e098bc9a3bf15c158481ea5db828abc1204cc65d0179a25aee1')

build () {
	cd "$pkgname-v$pkgver"
	python -m fissix -w -n facedetect
	sed -i -e '/^DATA_DIR\s/s:.*:DATA_DIR = "/usr/share/opencv4":' facedetect
}

package () {
	cd "$pkgname-v$pkgver"
	install -Dm755 facedetect "$pkgdir/usr/bin/facedetect"
	install -Dm755 README.rst "$pkgdir/usr/share/doc/$pkgname/README.rst"
}
