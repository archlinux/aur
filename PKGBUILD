# Maintainer: Can Altıparmak (gulaghad) <can6dev <AT> gmail <DOT> com>

pkgname=gfxtablet-git
pkgver=23.ff865c2
pkgrel=1
pkgdesc="Android app to control a virtual Network Tablet on Linux"
arch=('i686' 'x86_64')
url="http://github.com/rfc2822/GfxTablet"
license=('MIT')
makedepends=('git')
source=("$pkgname"::'git://github.com/rfc2822/GfxTablet.git'
        '99-uinput.rules')
md5sums=('SKIP'
         '38b5c44b17429f384a00d625b4019d7e')
install="${pkgname}.install"

pkgver() {
	cd "$pkgname"
	printf "%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	cd "$pkgname/driver-uinput"
	make
}

package() {
	install -Dm755 "$srcdir/$pkgname/driver-uinput/networktablet" "$pkgdir/usr/bin/networktablet"
	install -Dm644 "$srcdir/99-uinput.rules" "$pkgdir/etc/udev/rules.d/99-uinput.rules"
    install -Dm644 "$srcdir/$pkgname/LICENSE.md" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
