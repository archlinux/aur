# Maintainer: Roman Saveljev <roman.saveljev@haltian.com>
pkgname=kconfig-frontends
pkgver=3.12.0.0
pkgrel=2
pkgdesc='Out of the Linux source tree, packaging of the kconfig infrastructure, ready for use by third party projects'
arch=('x86_64' 'i686')
url="http://ymorin.is-a-geek.org/projects/kconfig-frontends"
license=('GPL')
depends=('ncurses' 'perl')
makedepends=('gperf')
source=("http://ymorin.is-a-geek.org/download/kconfig-frontends/$pkgname-$pkgver.tar.xz"
        "kconfig-config2h")
noextract=()
md5sums=('b939280dcc83f8feabd87a1d5f9b00c2'
         '6596064684b8d2bca25e8fec3e265adf')
validpgpkeys=()

build() {
	cd "$pkgname-$pkgver"
	./configure --prefix=/usr --enable-frontends=mconf,conf,nconf
	make
}

package() {
    install -dm755 ${pkgdir}/usr/bin
    install -m755 -t ${pkgdir}/usr/bin kconfig-config2h
	cd "$pkgname-$pkgver"
	make DESTDIR="$pkgdir/" install
}
