# Maintainer: Adrián Pérez de Castro <aperez@igalia.com>
pkgname='nuntius-git'
pkgdesc='Delivers notifications from your phone or tablet to your computer'
url='https://github.com/holylobster/nuntius-linux'
license=('GPL')
pkgver=r79.87dcb0a
pkgrel=1
arch=('x86_64' 'i686')
conflicts=('nuntius')
makedepends=('vala' 'intltool')
depends=('json-glib' 'desktop-file-utils' 'qrencode' 'gtk3')
source=("${pkgname}::git://github.com/holylobster/nuntius-linux"
	nuntius.install)
sha512sums=('SKIP'
            'b5b76afd64c3f0dcac7e20a24306a5af5f10635079320130f40281c0065dd0c7a5a2dc124a8086b0f9ebf601b7e5e137167faaa43b69b83a4c64d114f5713c37')
install='nuntius.install'


pkgver () {
    cd "${pkgname}"
    (
	set -o pipefail
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
