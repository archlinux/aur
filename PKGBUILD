# Maintainer: Mark Wagie <yochanan dot marqos at gmail dot com>
pkgname=aptik-gtk
pkgver=18.8
pkgrel=2
pkgdesc="GTK Frontend for Aptik System Migration Utility"
arch=('i686' 'x86_64')
url="https://github.com/teejee2008/aptik-gtk"
license=('GPL3')
depends=('aptik' 'glib2' 'gtk3' 'libgee')
makedepends=('git' 'vala' 'vte3')
source=("${pkgname}_v${pkgver}.tgz::https://github.com/teejee2008/${pkgname}/archive/v${pkgver}.tar.gz")
source+=('0001-Update-TermBox.vala.patch')
sha256sums=('1b5a0fc547ceafdc7bbf5005fa9b43b8fdac2ecb060bf004560f75b5ea84ff70'
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
