# Maintainer: Frantisek Fladung <ametisf@gmail.com>

pkgname=st-ametisf-git
_pkgname=st
pkgver=981.0145274
pkgrel=1
pkgdesc='Port of simple terminal to wayland - ametisf fork'
url='http://github.com/ametisf/st'
arch=('i686' 'x86_64')
license=('MIT')
options=('zipman')
depends=('libxft')
makedepends=('ncurses' 'libxext' 'git' 'tup')
epoch=1
# include config.h and any patches you want to have applied here
source=('git+https://github.com/ametisf/st.git')
sha1sums=('SKIP')

provides=($_pkgname)
conflicts=($_pkgname)

pkgver() {
	cd $_pkgname
	echo $(git rev-list --count master).$(git rev-parse --short master)
}

prepare() {
	cd $_pkgname
	cat >> config.tup << "EOF"
ENABLE_DEBUG=0
BUILD_STATIC=0
EOF
}

build() {
	cd $_pkgname
	tup init
	tup upd
}

package() {
    mkdir -p $pkgdir/usr/{bin,share/{doc,licenses}/$pkgname}
    install -m 755 $_pkgname/st $pkgdir/usr/bin
	install -m 644 $_pkgname/LICENSE $pkgdir/usr/share/licenses/$pkgname
	install -m 644 $_pkgname/README.md $pkgdir/usr/share/doc/$pkgname
	install -m 644 $_pkgname/FAQ $pkgdir/usr/share/doc/$pkgname
}
