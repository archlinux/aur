# Maintainer: nullgemm <nullgemm@mailbox.org>
pkgname=excalibar-git
pkgver=0.0.1
pkgrel=1
pkgdesc="sharp and shiny taskbar"
arch=('i686' 'x86_64')
url="https://github.com/nullgemm/excalibar"
license=('custom:WTFPL')
makedepends=('git')
depends=('libexcalibar-git' 'ttf-material-design-icons' 'libxcb' 'cairo' 'pango' 'libmpdclient')
source=("git+https://github.com/nullgemm/excalibar.git"
		"git+https://github.com/benhoyt/inih.git")
md5sums=('SKIP' 'SKIP')

prepare() {
	cd excalibar
	git submodule init
	git config submodule.inih.url $srcdir/excalibar/submodules/inih
	git submodule update
}

build() {
	cd excalibar/bar
	make
	cd ../plugins
	make
}

package() {
	cd excalibar/bar
	make DESTDIR="$pkgdir" install
	make cpconfig
	install -D -m644 ../license.md "${pkgdir}/usr/share/licenses/${pkgname}/WTFPL"
	cd ../plugins
	make install
}
