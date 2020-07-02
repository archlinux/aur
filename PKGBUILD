# Maintainer: Marius Lindvall <(firstname) {cat} varden {dog} info>

pkgname=python-spatialmedia
pkgver='2.1'
pkgrel=1
pkgdesc="Specifications and tools for 360 video and spatial audio."
arch=('any')
url='https://github.com/google/spatial-media'
license=('Apache')
depends=('python')
makedepends=('python-setuptools')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/google/spatial-media/archive/v${pkgver}.tar.gz"
	"spatialmedia.sh")
sha256sums=('38c682060bc5e348a73af2a9a77eab6fcb76ce33f9e5122915c30336b4a59654'
	    '8dd415f42d56533f360781391cd70368d7db74b938b30142187075af96aa29bc')

build() {
	cd "${srcdir}/spatial-media-${pkgver}"
	python setup.py build
}

package() {
	cd "${srcdir}/spatial-media-${pkgver}"
	python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
	install -Dm755 "${srcdir}/spatialmedia.sh" "${pkgdir}/usr/bin/spatialmedia"
}
