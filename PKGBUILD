# Maintainer: Joermungand <joermungand at gmail dot com>

pkgname=midifilter.lv2-git
pkgver=0.6.7.r1.g9f9e1ab
pkgrel=1
pkgdesc="LV2 plugins to filter MIDI events"
arch=('i686' 'x86_64')
url="https://github.com/x42/midifilter.lv2"
license=('GPL2')
groups=('lv2-plugins')
depends=('glibc')
makedepends=('git' 'lv2')
provides=('midifilter.lv2')
conflicts=('midifilter.lv2' 'x42-plugins')
source=("${pkgname%-*}"::'git+https://github.com/x42/midifilter.lv2.git')
md5sums=('SKIP')

pkgver() {
	cd "$srcdir/${pkgname%-*}"
	git describe --long --tags | sed -r 's/^v//;s/([^-]*-g)/r\1/;s/-/./g'
}

build() {
	cd "$srcdir/${pkgname%-*}"
    make
}

package() {
	cd "$srcdir/${pkgname%-*}"
	make DESTDIR="$pkgdir/" install PREFIX=/usr
	mkdir -p "$pkgdir/usr/share/doc/${pkgname%-*}"
    cp COPYING "$pkgdir/usr/share/doc/${pkgname%-*}/"
    cp README.md  "$pkgdir/usr/share/doc/${pkgname%-*}/"
    cp AUTHORS "$pkgdir/usr/share/doc/${pkgname%-*}/"
}

