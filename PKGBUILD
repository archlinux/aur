# Maintainer: Mark Wagie <yochanan dot marqos at gmail dot com>
pkgname=jdsp4linux-git
pkgver=r8.19fe01a
pkgrel=1
pkgdesc="A port of the open source version of JamesDSP to Linux"
arch=('x86_64')
url="https://github.com/ThePBone/JDSP4Linux"
license=('GPL2')
depends=('gst-plugin-jamesdsp' 'gst-plugins-good')
makedepends=('git')
optdepends=('gdb: for debugging')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}" 'viper4linux')
source=("${pkgname%-git}::git+https://github.com/ThePBone/JDSP4Linux.git"
        'devices.conf')
sha256sums=('SKIP'
            '7fd3a3ecdcf31fabe2171cce612bafcdef8de9d9d564211c02a8de33aea2dd15')

pkgver() {
	cd "$srcdir/${pkgname%-git}"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
	cd "$srcdir/${pkgname%-git}"
	install -Dm755 jdsp "$pkgdir/usr/bin/jdsp"
	install -Dm644 audio.conf "$pkgdir/etc/jamesdsp/audio.conf"
	install -Dm644 "$srcdir/devices.conf" "$pkgdir/etc/jamesdsp/devices.conf"
	install -Dm644 icon.png "pkgdir/usr/share/pixmaps/${pkgname%-git}.png"
}
