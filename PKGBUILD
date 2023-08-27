# Maintainer: lantw44 (at) gmail (dot) com

pkgname=guile-gnutls
pkgver=3.7.14
pkgrel=1
pkgdesc='Guile bindings for the GnuTLS library'
arch=('x86_64' 'i686' 'armv7h')
url='https://gitlab.com/gnutls/guile'
license=('LGPL')
depends=('guile' 'gnutls')
source=(
  "https://gitlab.com/gnutls/guile/uploads/1fdc941351d54cd7affda1bb912b9ca5/${pkgname}-${pkgver}.tar.gz"
  'guile-gnutls-merge-17-gnutls-3.8.1.patch')
sha256sums=(
  'de2bfcd4fd93d669e85f83c48a53470390fed60987158e9a14c9ff8e0beeb651'
  'b453442c171f5b6bb7fa698a9756e90780e7eac019288a24d3fc12c0b3936e21')

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
