# Maintainer: Adrián Pérez de Castro <aperez@igalia.com>
pkgname='nuntius-git'
pkgdesc='Delivers notifications from your phone or tablet to your computer'
url='https://github.com/holylobster/nuntius-linux'
license=('GPL')
pkgver=r24.acb1ef9
pkgrel=1
arch=('x86_64' 'i686')
makedepends=('vala' 'autoconf' 'automake' 'intltool')
depends=('json-glib' 'desktop-file-utils' 'gtk-update-icon-cache')
source=("${pkgname}::git://github.com/holylobster/nuntius-linux"
	nuntius.install)
sha512sums=('SKIP'
            '6dabcff8c668d4f7585677bc896b06b6eee506765016fbd3220000ab352a90ba49d14bfdc7082278274f99d9b0fbaf1e6921c330ed5cfca7e765ab04b896f2d1')
install='nuntius.install'


pkgver () {
	cd "${pkgname}"
	( set -o pipefail
      git describe --long 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
      printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
	)
}


build () {
	cd "${pkgname}"
	./autogen.sh --prefix=/usr --sysconfdir=/etc
	make
}


package () {
	cd "${pkgname}"
	make install DESTDIR="${pkgdir}"
}
