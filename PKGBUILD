# Maintainer: lantw44 (at) gmail (dot) com

pkgname=guile-gnutls
pkgver=4.0.0
pkgrel=1
pkgdesc='Guile bindings for the GnuTLS library'
arch=('x86_64' 'i686' 'armv7h')
url='https://gitlab.com/gnutls/guile'
license=('LGPL')
depends=('guile' 'gnutls')
source=(
  "https://gitlab.com/gnutls/guile/uploads/9060bc55069cedb40ab46cea49b439c0/${pkgname}-${pkgver}.tar.gz"
  "https://gitlab.com/gnutls/guile/uploads/a3c53a85b8dfafc23fb6ccc65de7b545/${pkgname}-${pkgver}.tar.gz.sig")
sha256sums=(
  '5b4cb926032076ec346bb5c0bc0d0231f968fe0f565913cc16934bb793afb239'
  'eaeb21b4abde3f8d1a7e5e793fb7da99996bf6993be1d6aacdce5fbb8c3029bf')
validpgpkeys=('B1D2BD1375BECB784CF4F8C4D73CF638C53C06BE')

prepare() {
	cd "${srcdir}/${pkgname}-${pkgver}"
	local source_file
	for source_file in "${source[@]}"; do
		case "${source_file}" in
			*.patch)
				patch -p1 < "${srcdir}/${source_file}"
				;;
		esac
	done
}

build() {
	cd "${srcdir}/${pkgname}-${pkgver}"
	./configure --prefix=/usr --disable-srp-authentication
	make
}

check() {
	cd "${srcdir}/${pkgname}-${pkgver}"
	make check
}

package() {
	cd "${srcdir}/${pkgname}-${pkgver}"
	make DESTDIR="${pkgdir}" install
}
