# Maintainer: Thomas Kühnel <kuehnelth@gmail.com>
# Contributor: Mario Vazquez <mariovazq@gmail.com>

pkgname=tcltls
pkgver=2.0.1
pkgrel=2
pkgdesc="OpenSSL extension to Tcl providing TLS/SSL channel capabilities"
arch=('x86_64' 'aarch64')
url="https://core.tcl-lang.org/tcltls/home"
license=('TCL')
provides=('tls')
depends=('tcl' 'openssl')
options=('!emptydirs')
source=("https://core.tcl-lang.org/tcltls/uv/tcltls${pkgver}.tar.gz")
sha256sums=('afffeb5de1978f47745db4804c1dfdcd6605ceac32e324fe8bbe49843de0baae')

build() {
	cd "${srcdir}/tcltls${pkgver}"

	./configure \
		--prefix=/usr \
		--libdir=/usr/lib \
		--mandir=/usr/share/man \
		--enable-64bit \
		--enable-ssl-fastpath \
		--enable-hardening \
		--disable-rpath \
		--disable-ssl3 \
		--disable-tls1 \
		--disable-tls1_1 \
		--with-tcl=/usr/lib \
		--with-openssl-dir=/usr

	make
}

check() {
	cd "${srcdir}/tcltls${pkgver}"
	make test
}

package() {
	cd "${srcdir}/tcltls${pkgver}"
	make DESTDIR="${pkgdir}" install

	install -Dm644 license.terms "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
