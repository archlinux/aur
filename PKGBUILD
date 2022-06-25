# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: Tucker Boniface <tucker@boniface.tech>
# Contributor: lilydjwg <lilydjwg@gmail.com>
# Contributor: Jakub Wilk <jwilk@jwilk.net>

pkgname=fbcat-git
pkgver=0.5.2.r3.gb5d3fe6
pkgrel=1
pkgdesc='Framebuffer screenshot tool'
arch=('x86_64')
url="https://github.com/jwilk/fbcat"
license=('GPL2')
makedepends=('docbook-xsl' 'git')
provides=("${pkgname%-git}=${pkgver%.r*}" 'fbgrab')
conflicts=("${pkgname%-git}")
source=("$pkgname::git+$url")
sha256sums=('SKIP')

pkgver() {
	git -C "$pkgname" describe --long --tags | sed 's/-/.r/;s/-/./'
}

prepare() {
	cd "$pkgname"
	sed -i -e '/PREFIX/s/=/?=/' -e '/DESTDIR/s/=/?=/' Makefile
}

build() {
	make -C "$pkgname"
	make -C "$pkgname/doc/"
}

package() {
	make -C "$pkgname" install PREFIX=/usr DESTDIR="$pkgdir/"
}
