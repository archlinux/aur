# Maintainer: Dalton "naelstrof" Nell <naelstrof@gmail.com>
pkgname=tmxlite-git
pkgver=v1.0.0.r0.gfa0845c
pkgrel=1
pkgdesc="Lightweight C++14 parser for Tiled tmx files"
arch=('x86_64' 'x86')
url="https://github.com/fallahn/tmxlite"
license=('GPL')
groups=()
depends=()
makedepends=('git') # 'bzr', 'git', 'mercurial' or 'subversion'
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
replaces=()
backup=()
options=()
install=
source=('tmxlite::git+https://github.com/fallahn/tmxlite.git#branch=master')
noextract=()
md5sums=('SKIP')

pkgver() {
	cd "$srcdir/${pkgname%-git}"

    git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
	cd "$srcdir/${pkgname%-git}/tmxlite"
    cmake ./
}

build() {
	cd "$srcdir/${pkgname%-git}/tmxlite"
	make
}

package() {
	cd "$srcdir/${pkgname%-git}/tmxlite"
    mkdir -p "$pkgdir/usr/lib"
    mkdir -p "$pkgdir/usr/include"
    cp -r include/tmxlite "$pkgdir/usr/include"
    cp libtmxlite.so "$pkgdir/usr/lib"
}
