# Maintainer: G Queiroz <gabrieljvnq@gmail.com>
pkgname=openicp-br
pkgver=0.2.1
pkgrel=1
pkgdesc="Digital signatures tool according to Brazilian Law."
arch=('x86_64')
url="github.comn/gjvnq/OpenICP-BR"
license=('AGPL')
groups=()
depends=('wxgtk3' 'gtk-update-icon-cache' 'openssl')
makedepends=('git')
provides=("${pkgname}")
conflicts=("${pkgname%-git}" "${pkgname%}")
replaces=()
backup=()
options=()
install=
source=("$pkgname-$pkgver.tar.gz::https://github.com/gjvnq/OpenICP-BR/archive/v0.2.1.tar.gz")
noextract=()
sha1sums=('9e269d9708fa2b86da052dd384d1656f7651f2ba')

build() {
	tar xf "$pkgname-$pkgver.tar.gz"
	cd "$srcdir/OpenICP-BR-$pkgver"
	WX_CONFIG=/usr/bin/wx-config-gtk3 cmake . -DNO_TESTS=1 -DTRY_SYSTEM_OPENSSL=1
	make openicp
}

package() {
	cd "$srcdir/OpenICP-BR-$pkgver"
	make DESTDIR="$pkgdir/" install
}
