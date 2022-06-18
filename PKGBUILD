# Maintainer: Evan Purkhiser <evanpurkhiser@gmail.com>

pkgname=setcolors-git
pkgdesc="Allows you to set the linux VT101 default color palette"
license=('MIT')
url="https://github.com/evanpurkhiser/linux-vt-setcolors"
pkgver=62.4e1686f
pkgrel=1

source=("$pkgname::git+$url.git")
md5sums=('SKIP')
depends=('glibc')
makedepends=('git')
arch=('i686' 'x86_64')

pkgver() {
	cd "$srcdir/$pkgname"
	echo $(git rev-list --count HEAD).$(git rev-parse --short HEAD)
}

build() {
	cd "$srcdir/$pkgname"
	make
}

package() {
	cd "$srcdir/$pkgname"

	make PREFIX=/usr DESTDIR="${pkgdir}" install
	install -Dm 644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
