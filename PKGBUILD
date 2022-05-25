# Maintainer: c6parmak <can6parmak <AT> gmail <DOT> com>
# Contributor: Lucki <https://aur.archlinux.org/account/Lucki/>

pkgname=gfxtablet-git
pkgver=51.7bd5181
pkgrel=1
pkgdesc="Android app to control a virtual Network Tablet on Linux"
arch=('i686' 'x86_64')
url="https://github.com/rfc2822/GfxTablet"
license=('MIT')
makedepends=('git')
provides=('gfxtablet')
conflicts=('gfxtablet')
source=("$pkgname"::'git+https://github.com/rfc2822/GfxTablet.git'
        '99-uinput.rules')
md5sums=('SKIP'
         'eaa7b50c8714e6c94637a65269d54b81')
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
