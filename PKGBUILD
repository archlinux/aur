# Maintainer: Victor A. Santos  <victoraur.santos@gmail.com>
pkgname=qsubber-git
pkgver=r8.5281b0b
pkgrel=1
pkgdesc="OpenSubtitles.org client for download subtiltes"
arch=('x86' 'x86_64')
url="https://github.com/hotvic/QSubber"
license=('GPL3')
depends=('desktop-file-utils' 'xmlrpc-c' 'qt5-base')
makedepends=('git' 'qt5-base')
install=qsubber.install
source=("$pkgname::git+https://github.com/hotvic/QSubber.git")
md5sums=('SKIP')

pkgver() {
	cd "$srcdir/${pkgname}"

	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	cd "$srcdir/${pkgname}"

    qmake-qt5 -o Makefile qsubber.pro
	make
}

package() {
	cd "$srcdir/${pkgname}"

    install -Dm755 build/qsubber "$pkgdir/usr/bin/qsubber"
}
