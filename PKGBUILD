# Maintainer: lantw44 (at) gmail (dot) com

pkgname=guile-ssh
pkgver=0.11.3
pkgrel=2
pkgdesc='SSH module for Guile based on libssh'
arch=('x86_64' 'i686' 'armv7h')
url="https://github.com/artyom-poptsov/guile-ssh"
license=('GPL3')
depends=(
  'guile>=2.0.9'
  'libssh>=0.7.3')
source=("https://github.com/artyom-poptsov/guile-ssh/archive/v${pkgver}.tar.gz")
sha256sums=('1373bf6f30ba9b4404c044fb00c0509cbd851606264803faccbf881b1efb52bc')

build() {
	cd "${srcdir}/${pkgname}-${pkgver}"
	sed -i 's|-lssh_threads||' libguile-ssh/Makefile.am
	autoreconf -fi
	./configure --prefix=/usr --disable-rpath
	make
}

check() {
	# Disable tests until upstream fixes it.
	# https://github.com/artyom-poptsov/guile-ssh/issues/10
	return 0

	cd "${srcdir}/${pkgname}-${pkgver}"
	make check
}

package() {
	cd "${srcdir}/${pkgname}-${pkgver}"
	make DESTDIR="${pkgdir}" install
}
