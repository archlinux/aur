# Maintainer: Thomas Weißschuh <thomas t-8ch de>

pkgname=needrestart
url=https://github.com/liske/needrestart
pkgdesc='Restart daemons after library updates.'
pkgver=3.0
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

sha256sums=('229a7905ecde57ffbf4798565aff9e1708b8e99f286f4a31f74506e979fb38d5')
