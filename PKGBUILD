# Maintainer: Emilio Reggi <nag@mailbox.org>
pkgname=nntpit-git
_pkgname=nntpit
pkgver=r32.31081c8
pkgrel=1
pkgdesc="A simple reddit2nntp gateway server that lets you use a newsreader to follow discussions on reddit."
arch=('x86_64')
url="https://github.com/taviso/nntpit"
license=('unknown') # As of 2021-08-29, upstream issue is opened here: https://github.com/taviso/nntpit/issues/11
depends=('curl' 'json-c' 'glib2' 'libev')
makedepends=('git')
conflicts=("${_pkgname}")
replaces=("${_pkgname}")
source=("${_pkgname}"::"git+${url}")
md5sums=('SKIP')

prepare() {
	cd "$_pkgname"
}

pkgver() {
	cd "$_pkgname"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	cd "$_pkgname"
	autoreconf -i
	./configure --prefix=/usr
	make
}

package() {
	cd "$_pkgname"
	make DESTDIR="$pkgdir/" install
}
