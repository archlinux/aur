# Maintainer: Mike Jones <mike@mjones.io>

pkgname=guile-ssh
pkgver=0.18.0
pkgrel=1
pkgdesc='SSH module for Guile based on libssh'
arch=('x86_64' 'i686' 'armv7h')
url="https://github.com/artyom-poptsov/guile-ssh"
license=('GPL-3.0-or-later')
depends=(
  'guile>=2.0.9'
  'libssh>=0.7.3')
source=(
  "${pkgname}-${pkgver}.tar.gz::https://github.com/artyom-poptsov/guile-ssh/archive/v${pkgver}.tar.gz")
sha256sums=(
  '0a73ca82b549c2b41535f4e955c11370c7c97b6300128768c6439f4c8a12c685')

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
