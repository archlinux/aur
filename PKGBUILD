# Maintainer: Caleb Maclennan <caleb@alerque.com>
# Contributor: Marcell Meszaros < marcell.meszaros AT runbox.eu >
# Contributor: aksr <aksr at t-com dot me>
# Contributor: xduugu

pkgname=diff-pdf-git
pkgver=0.5.r1.g201dab3
pkgrel=2
pkgdesc='A simple tool for visually comparing two PDF files'
arch=(x86_64 i686)
url="http://vslavik.github.io/${pkgname%-git}"
_url="https://github.com/vslavik/${pkgname%-git}"
license=(GPL)
depends=(poppler-glib
         wxgtk3)
makedepends=(git)
provides=("${pkgname%-git}=$pkgver")
conflicts=("${pkgname%-git}")
source=("git+$_url.git")
md5sums=('SKIP')

prepare() {
	cd "${pkgname%-git}"
	./bootstrap
}

pkgver() {
	cd "${pkgname%-git}"
	git describe --long --tags --abbrev=7 --match="v*" HEAD |
		sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
	cd "${pkgname%-git}"
	./configure --prefix /usr \
		--with-wx-config=wx-config-gtk3
	make
}

package() {
	cd "${pkgname%-git}"
	make DESTDIR="$pkgdir" install
}
