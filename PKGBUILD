# Maintainer: Thomas Weißschuh <thomas t-8ch.de>

pkgname=needrestart
url=https://github.com/liske/needrestart
pkgdesc='Restart daemons after library updates.'
pkgver=2.0
pkgrel=1
source=("needrestart-${pkgver}.tar.gz::https://github.com/liske/needrestart/archive/v${pkgver}.tar.gz")
arch=(any)
license=('GPL')
options=(!emptydirs)
depends=(perl-module-find
         perl-term-readkey
         perl-proc-processtable
         perl-sort-naturally
)

build() {
	cd "${srcdir}/${pkgname}-${pkgver}"
	make
}

prepare() {
	cd "${srcdir}/${pkgname}-${pkgver}"
	sed -i -e 's|/usr/sbin|/usr/bin|' Makefile
}

package() {
	cd "${srcdir}/${pkgname}-${pkgver}"
	make DESTDIR="${pkgdir}" install
}

sha256sums=('3626079004ad04a744e647a14ee5dc19b02fc306e9b790c530120ff509a348c9')
