# Maintainer: Javier Tia <javier dot tia at gmail dot com>

pkgname=alsa-sndio
pkgver=0.2
pkgrel=2
pkgdesc="ALSA PCM to play audio on sndio servers"
arch=('i686' 'x86_64')
url="https://github.com/Duncaen/alsa-sndio"
license=('ISC')
depends=(alsa-lib sndio python-pystache)
source=("https://github.com/Duncaen/${pkgname}/archive/${pkgver}.tar.gz")
sha512sums=('50371881eaceb224703632df1078ea6d39eb51d9cc652029cc75a41f4b66f4a1d73f8f9b07cfbba27c11db5c6bcf5c4c9c80e26d0d7b8a305bc6a48f9f63e8c7')

build() {
	cd "${srcdir}/${pkgname}-${pkgver}"

	sed -i 's?/usr/local?/usr?g' Makefile

	make
}

package() {
	cd "${srcdir}/${pkgname}-${pkgver}"

	make DESTDIR="${pkgdir}/" install

	install -d "${pkgdir}/usr/share/licenses/${pkgname}"
	install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
