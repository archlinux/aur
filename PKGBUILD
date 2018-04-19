# Maintainer: Jeremie Nevin <contact@neurovertex.eu>

pkgname=texiteasy
pkgver=0.21.6
pkgrel=1
pkgdesc="Simple and Powerful Latex Editor"
arch=(any)
url="http://texiteasy.com/"
license=('GPL3')
depends=('qt4' 'poppler-qt4' 'zlib' 'texlive-core')
makedepends=('make' 'gcc')
optdepends=('texlive-lang: Support for additional charsets' 'texlive-most: Additional texlive libraries')
source=($pkgname::git+https://github.com/Bramas/texiteasy)
md5sums=('SKIP')

pkgver() {
	cd "$srcdir/$pkgname"
	git tag --sort=version:refname | tail -n 1 | sed -r 's/^v([0-9.]+)/\1/;s/-/./'
}

build() {
	cd "$srcdir/$pkgname/source"
	qmake-qt4 $pkgname.pro
	make
}

package() {
	cd "$srcdir/$pkgname/source"
	make INSTALL_ROOT=$pkgdir install
	cd ..
	install -Dm644 -t $pkgdir/usr/share/texiteasy/dictionaries/ bundler_files/deb/share/texiteasy/dictionaries/*
	desktop-file-install bundler_files/deb/share/applications/texiteasy.desktop --dir=$pkgdir/usr/share/applications/
}
