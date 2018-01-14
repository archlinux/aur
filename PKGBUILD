# Maintainer: PaterSiul <PaterSiul at gmail dot com>

pkgname=csync-git
pkgver=r1010.d153943
pkgrel=2
pkgdesc="A lightweight utility to synchronize files between two directories"
arch=('x86_64')
url="https://www.csync.org/"
license=('GPL2')
depends=('sqlite>=3.4' 'iniparser>=2.10')
optdepends=('libssh>=0.5' 'smbclient>=3.5')
makedpends=('cmake>=2.6.0' 'check>=0.9.5' 'doxygen' 'cmocka' 'texlive-bin' 'git')
source=("$pkgname::git+https://git.cryptomilk.org/projects/csync.git/")
md5sums=('SKIP')
pkgver() {
        cd "$pkgname/"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}
build() {
	[[ -d "$srcdir/$pkgname/build/" ]] || mkdir "$srcdir/$pkgname/build/"
	cd "$pkgname/build/"
	cmake -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX=/usr -DSYSCONF_INSTALL_DIR=/etc "$srcdir/$pkgname"
	make
}
package() {
        cd "$srcdir/$pkgname/build"
        make DESTDIR="$pkgdir/" install
}
