# Maintainer: Mark Wagie <mark dot wagie at tutanota dot com>
pkgname=gst-plugin-viper4linux-git
_gitname=gst-plugin-viperfx
pkgver=r32.f6b4d8b
pkgrel=3
pkgdesc="ViPER FX core wrapper plugin for gstreamer"
arch=('x86_64')
url="https://github.com/Audio4Linux/gst-plugin-viperfx"
license=('custom')
depends=('gstreamer' 'libviperfx')
makedepends=('git' 'cmake')
provides=("${pkgname%-git}" "$_gitname" 'libgstviperfx.so')
conflicts=("${pkgname%-git}" "$_gitname" 'gst-plugin-jamesdsp' )
source=('git+https://github.com/Audio4Linux/gst-plugin-viperfx.git')
sha256sums=('SKIP')

pkgver() {
	cd "$srcdir/$_gitname"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	cd "$srcdir/$_gitname"
	cmake -B build -S . \
		-Wno-dev
	make -C build
}

package() {
	cd "$srcdir/$_gitname"
	install -Dm755 build/libgstviperfx.so -t "$pkgdir/usr/lib/gstreamer-1.0"
	install -Dm644 COPYING -t "$pkgdir/usr/share/licenses/$_gitname"
}
