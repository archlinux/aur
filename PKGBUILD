# Maintainer: lantw44 (at) gmail (dot) com

pkgname=guile-ssh
pkgver=0.16.3
pkgrel=1
pkgdesc='SSH module for Guile based on libssh'
arch=('x86_64' 'i686' 'armv7h')
url="https://github.com/artyom-poptsov/guile-ssh"
license=('GPL3')
depends=(
  'guile>=2.0.9'
  'libssh>=0.7.3')
source=(
  "${pkgname}-${pkgver}.tar.gz::https://github.com/artyom-poptsov/guile-ssh/archive/v${pkgver}.tar.gz")
sha256sums=(
  '96c235a630fc53120881e5af325c7720b5bb19c6a7eab818ace1f3d0b7669d56')

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
