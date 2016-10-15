# Maintainer: Thomas Weißschuh <thomas t-8ch de>

pkgname=needrestart
url=https://github.com/liske/needrestart
pkgdesc='Restart daemons after library updates.'
pkgver=2.9
pkgrel=1
source=("needrestart-${pkgver}.tar.gz::https://github.com/liske/needrestart/archive/v${pkgver}.tar.gz")
arch=(any)
license=('GPL')
options=(!emptydirs)
depends=(perl-module-find
         perl-term-readkey
         perl-proc-processtable
         perl-sort-naturally
         perl-module-scandeps
         perl-libintl-perl
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

sha256sums=('812c9594a5a262524f354f2290d8f9cd623004b30222aaeb37faa8cc911bd89f')
