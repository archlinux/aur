# Maintainer: lantw44 (at) gmail (dot) com

pkgname=guile-ssh
pkgver=0.12.0
pkgrel=1
pkgdesc='SSH module for Guile based on libssh'
arch=('x86_64' 'i686' 'armv7h')
url="https://github.com/artyom-poptsov/guile-ssh"
license=('GPL3')
depends=(
  'guile>=2.0.9'
  'libssh>=0.7.3')
source=(
  "https://github.com/artyom-poptsov/guile-ssh/archive/v${pkgver}.tar.gz")
sha256sums=(
  'd5b610fa0259187a824dfd26b11a415c1ca7b107912feea8b1a9e7c0fcfbe59c')

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
	autoreconf -fi
	./configure --prefix=/usr --disable-rpath
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
