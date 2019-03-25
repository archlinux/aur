# Maintainer: Sebastian Krzyszkowiak <dos@dosowisko.net>
pkgname=zero_brightness_fixer-git
pkgver=r28.c03f8a4
pkgrel=1
pkgdesc="The inotify enabled app to fix zero brightness drop in Linux"
url="https://github.com/sliusar/zero_brightness_fixer"
arch=('x86_64')
license=('unknown')
groups=()
depends=()
makedepends=('git')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=('git+https://github.com/sliusar/zero_brightness_fixer'
        'zero_brightness_fixer.service')
md5sums=('SKIP'
         '28ad7cad643ce98e061799b298fba01d')

pkgver() {
	cd "$srcdir/${pkgname%-git}"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}


build() {
	cd "$srcdir/${pkgname%-git}"
	make
}

package() {
	cd "$srcdir/${pkgname%-git}"
	mkdir -p "$pkgdir/usr/bin/" "$pkgdir/etc/systemd/system/"
	cp zero_brightness_fixer "$pkgdir/usr/bin/"
	cp ../zero_brightness_fixer.service "$pkgdir/etc/systemd/system/"
}
