# Maintainer: c6parmak <can6parmak <AT> gmail <DOT> com>
# Contributor: Lucki <https://aur.archlinux.org/account/Lucki/>

pkgname=gfxtablet-git
pkgver=50.128060d
pkgrel=2
pkgdesc="Android app to control a virtual Network Tablet on Linux"
arch=('i686' 'x86_64')
url="http://github.com/rfc2822/GfxTablet"
license=('MIT')
makedepends=('git')
provides=('gfxtablet')
conflicts=('gfxtablet')
source=("$pkgname"::'git://github.com/rfc2822/GfxTablet.git'
        '99-uinput.rules')
md5sums=('SKIP'
         'b5d5b8e5291c08302a7a6dff8aa1ebf2')
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
