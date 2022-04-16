# Maintainer: Emilio Reggi <nag@mailbox.org>
pkgname=nntpit-git
_pkgname=nntpit
pkgver=r45.9076121
pkgrel=1
pkgdesc="A simple reddit2nntp gateway server that lets you use a newsreader to follow discussions on reddit."
arch=('x86_64')
url="https://github.com/taviso/nntpit"
license=('MIT')
depends=('curl' 'json-c' 'glib2' 'libev')
makedepends=('git')
conflicts=("${_pkgname}")
replaces=("${_pkgname}")
source=("${_pkgname}"::"git+${url}" "LICENSE-$pkgver::$url/raw/main/LICENSE")
sha256sums=('SKIP' '8535fefdac77bd012a69fab8402b016daa4827498863fa2d8dbaebe1caa0ae12')

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
	make DESTDIR="$pkgdir" install
	install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$_pkgname/"
}
