# Maintainer: Rasmus Steinke <rasi at xssn dot at>

pkgname=xininfo-git
pkgver=42.0bd94ad
pkgrel=1
pkgdesc="Small helper program for monitor layouts."
arch=('any')
url='https://github.com/DaveDavenport/xininfo'
license=('GPL')
depends=('xcb-util-wm' 'xcb-util')
options=(!strip)
provides=('xininfo')
install=xininfo-git.install
makedepends=('git' 'xorgproto')
source=('git+https://github.com/DaveDavenport/xininfo.git')

pkgver() {
	cd xininfo
	printf "%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
    cd ${srcdir}/xininfo
    autoreconf --install
    CC=gcc ./configure --prefix=/usr
    make
}

package() {
    cd "$srcdir/xininfo"
    make install DESTDIR="$pkgdir"
}

md5sums=('SKIP')
