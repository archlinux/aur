# Maintainer: lantw44 (at) gmail (dot) com

pkgname=guile-ssh
pkgver=0.11.3
pkgrel=4
pkgdesc='SSH module for Guile based on libssh'
arch=('x86_64' 'i686' 'armv7h')
url="https://github.com/artyom-poptsov/guile-ssh"
license=('GPL3')
depends=(
  'guile>=2.0.9'
  'libssh>=0.7.3')
source=(
  "https://github.com/artyom-poptsov/guile-ssh/archive/v${pkgver}.tar.gz"
  'guile-ssh-0.11.3-fix-segfault.patch'
  'guile-ssh-0.11.3-libssh-0.8-name.patch'
  'guile-ssh-0.11.3-libssh-0.8-tests.patch')
sha256sums=(
  '1373bf6f30ba9b4404c044fb00c0509cbd851606264803faccbf881b1efb52bc'
  'f3284d61b7166be9809e37c7ced323d45255479e51f68f46f0499d9a3056b535'
  '4a0ab224a08afc832ce82dc055f23c36c56f7e63f4f2b1814571a3c930d9cae6'
  '5594153165cade97481c50284aade32153801232c65a958abd3e25a2eb237841')

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
