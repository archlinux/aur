# Contributor: Jashank Jeremy <arch-aur at jashankj dot space>
# Maintainer: Tavian Barnes <tavianator@tavianator.com>

pkgname=libxo
pkgver=2.0.0
pkgrel=1
pkgdesc='A library for generating text, XML, JSON, and HTML output'
arch=('x86_64')
url='https://github.com/juniper/libxo'
license=('BSD')
groups=()
depends=()
makedepends=('byacc')
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
source=("https://github.com/juniper/$pkgname/releases/download/$pkgver/$pkgname-$pkgver.tar.gz"
        lintl.patch)
sha256sums=('982de1877309dd9d57f4cabf2c8bbf42c1c15dc402cd8586ab1e4eabaea298eb'
            '07cc99197e64681753b2abae825dfaa658f910a77101cb69626f5d9ed333f245')
noextract=()

prepare() {
	cd "${pkgname}-${pkgver}"
	patch -p1 -i "${srcdir}/lintl.patch"
}

build() {
	cd "${pkgname}-${pkgver}"

        CFLAGS="$CFLAGS -std=c17"
	sh ./bin/setup.sh
	sh ./configure --prefix=/usr
	make
}

check() {
	cd "${pkgname}-${pkgver}"
	make -k check
}

package() {
	cd "${pkgname}-${pkgver}"
	make install DESTDIR="$pkgdir/"
}
