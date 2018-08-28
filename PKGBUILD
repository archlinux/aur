# Maintainer: Kristian Grønås <morguldir@protonmail.com>
pkgname=aclidswitch-git
_pkgname=aclidswitch
pkgdesc='Simple Power Management tool'
pkgrel=4
pkgver=35.19b1955
arch=('any')
license=('GPL2')
install=$pkgname.install
depends=('light' 'xorg-xset')
backup=("etc/default/$_pkgname")
makedepends=('git')
url="https://github.com/nielsema/$_pkgname"
source=("git+https://github.com/nielsema/$_pkgname")
md5sums=('SKIP')

prepare() {
	cd $srcdir/$_pkgname
	sed -i "s|/usr/local/bin/aclidswitch|/usr/bin/aclidswitch|g" *.rules
}
package() {
	install -Dm644 "$srcdir/$_pkgname/default/aclidswitch" "$pkgdir/etc/default/aclidswitch"
	install -Dm644 "$srcdir/$_pkgname/98-aclidswitch.rules" "$pkgdir/usr/lib/udev/rules.d/97-aclidswitch.rules"
	install -Dm644 "$srcdir/$_pkgname/99-low-battery-action.rules" "$pkgdir/usr/lib/udev/rules.d/98-low-battery-action.rules"
	install -Dm644 "$srcdir/$_pkgname/LICENSE" "$pkgdir/usr/share/licenses/_$pkgname/LICENSE"
	install -Dm755 "$srcdir/$_pkgname/aclidswitch" "$pkgdir/usr/bin/aclidswitch"
}

pkgver() {
	cd $_pkgname
	echo "$(git rev-list --count HEAD).$(git describe --always )"
}
