# Maintainer: BrainDamage

pkgname=keyfinder-cli
pkgver=1.1.2
pkgrel=1
pkgdesc='Estimate the musical key of many different audio file formats'
arch=(x86_64 aarch64 armv7h)
url='https://github.com/evanpurkhiser/keyfinder-cli'
license=('GPL-3.0-only')
depends=(ffmpeg libkeyfinder fftw)
source=("https://github.com/evanpurkhiser/keyfinder-cli/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('144539cd7fee223dca3a052435c1b2df0ab8b8c3170753ecc7f9c4d915d2bb07')


_basename="${pkgname}"
_dirname="${pkgname}-${pkgver}"

build() {
  cd "${srcdir}/${_dirname}"
  make
}

package() {
	cd "${srcdir}/${_dirname}"
	make PREFIX='/usr' INSTALL_ROOT="${pkgdir}" DESTDIR="${pkgdir}" install

	find . -maxdepth 1 -iname 'README*' \
		-exec install -Dvm 644 -t "${pkgdir}/usr/share/doc/${_basename}" {} +
	find . -maxdepth 1 -iname 'LICENSE*' \
		-exec install -Dvm 644 -t "${pkgdir}/usr/share/licenses/${_basename}" {} +
}
