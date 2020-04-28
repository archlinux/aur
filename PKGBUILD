# Maintainer: Mark Wagie <mark dot wagie at tutanota dot com>
pkgname=jdsp4linux-git
pkgver=r27.7838c5c
pkgrel=2
pkgdesc="A port of the open source version of JamesDSP to Linux"
arch=('x86_64')
url="https://github.com/Audio4Linux/JDSP4Linux"
license=('GPL2')
depends=('gst-plugin-jamesdsp' 'gst-plugins-good')
makedepends=('git')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}" 'viper4linux')
backup=('etc/jamesdsp/audio.conf'
        'etc/jamesdsp/devices.conf')
source=("${pkgname%-git}::git+https://github.com/Audio4Linux/JDSP4Linux.git"
        'devices.conf')
sha256sums=('SKIP'
            '7fd3a3ecdcf31fabe2171cce612bafcdef8de9d9d564211c02a8de33aea2dd15')

pkgver() {
	cd "$srcdir/${pkgname%-git}"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
	cd "$srcdir/${pkgname%-git}"
	install -Dm755 jdsp -t "$pkgdir/usr/bin"
	install -Dm644 audio.conf "$srcdir/devices.conf" -t "$pkgdir/etc/jamesdsp"
	install -Dm644 icon.png "pkgdir/usr/share/pixmaps/${pkgname%-git}.png"
}
