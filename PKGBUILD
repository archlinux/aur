# Maintainer: Mark Wagie <yochanan dot marqos at gmail dot com>
pkgname=gst-plugin-viper4linux-git
_gitname=gst-plugin-viperfx
pkgver=r21.e0a615e
pkgrel=1
pkgdesc="ViPER FX core wrapper plugin for gstreamer"
arch=('x86_64')
url="https://github.com/L3vi47h4N/gst-plugin-viperfx"
license=('custom')
depends=('gstreamer' 'libviperfx')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}" "$_gitname")
replaces=("$_gitname")
source=('git+https://github.com/L3vi47h4N/gst-plugin-viperfx')
md5sums=('SKIP')

pkgver() {
	cd "$srcdir/$_gitname"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	cd "$srcdir/$_gitname"
	./autogen.sh
	make
}

package() {
	cd "$srcdir/$_gitname"
	install -Dm755 "src/.libs/libgstviperfx.so" "$pkgdir/usr/lib/gstreamer-1.0/libgstviperfx.so"
    install -Dm644 COPYING "$pkgdir/usr/share/licenses/$_gitname/COPYING"
}
