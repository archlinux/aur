# Maintainer: Alexander Bocken <alexander@bocken.org>
pkgname=bthandler
pkgver=r88.1223574
pkgrel=1
pkgdesc="A shell script to interact with bluetooth devices via dmenu"
arch=(any)
depends=('bluez-utils')
makedepends=('git')
optdepends=(
	'dmenu: display menu'
)
url="https://github.com/AlexBocken/bthandler"
license=('AGPL3')
source=('bthandler::git+https://github.com/AlexBocken/bthandler.git')
md5sums=('SKIP')
pkgver() {
	cd "$srcdir/$pkgname"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}
package() {
	cd "$srcdir/$pkgname"
	mkdir -p /home/${USER}/.config/bt
	cp config /home/${USER}/.config/bt/config
	touch /home/${USER}/.config/bt/blacklist
	touch /home/${USER}/.config/bt/alias
	touch /home/${USER}/.config/bt/paired

	#remove wrong older install location
	rm -f $pkgdir/usr/bin/bt

	install -Dm755 bt $pkgdir/usr/local/bin/bt
	install -Dm644 LICENSE $pkgdir/usr/share/licenses/${pkgname}/LICENSE
}
