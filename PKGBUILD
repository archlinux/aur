# Maintainer: Mark Wagie <yochanan.marqos@gmail.com>
pkgname=aptik-gtk
pkgver=18.6
pkgrel=1
pkgdesc="GTK Frontend for Aptik System Migration Utility"
arch=('i686' 'x86_64')
url="https://github.com/teejee2008/aptik-gtk"
license=('GPL3')
depends=('aptik' 'glib2' 'gtk3' 'libgee')
makedepends=('git' 'vala' 'vte3')
provides=(aptik-gtk)
source=("${pkgname}_v${pkgver}.tgz::https://github.com/teejee2008/${pkgname}/archive/v${pkgver}.tar.gz")
source+=('0001-Update-TermBox.vala.patch')
sha256sums=('b8c50109eaaf9cbe5cef8dbbb6450b7ebb02e0daf68279f57d1e8bef4f14e1e8'
            'fb0d459de84b1822047df78a7d58fa9f34c1c39181010c6a1b7565c18e58856b')

prepare() {
    cd $pkgname-$pkgver
    patch -Np1 -i "${srcdir}/0001-Update-TermBox.vala.patch"
}

build() {
	cd "${pkgname}-${pkgver}"
	make all
}

package() {
	cd "${pkgname}-${pkgver}"
	make DESTDIR="$pkgdir/" install
}
