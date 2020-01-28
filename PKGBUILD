# Maintainer: Mark Wagie <mark dot wagie at tutanota dot com>
pkgname=gst-plugin-viper4linux-git
_gitname=gst-plugin-viperfx
pkgver=r32.f6b4d8b
pkgrel=1
pkgdesc="ViPER FX core wrapper plugin for gstreamer"
arch=('x86_64')
url="https://github.com/Audio4Linux/gst-plugin-viperfx"
license=('custom')
depends=('gstreamer' 'libviperfx')
makedepends=('git')
provides=("${pkgname%-git}" "$_gitname" 'libgstviperfx')
conflicts=("${pkgname%-git}" "$_gitname" 'libgstviperfx' 'gst-plugin-jamesdsp' )
replaces=("$_gitname")
source=('git+https://github.com/Audio4Linux/gst-plugin-viperfx.git')
sha256sums=('SKIP')

pkgver() {
	cd "$srcdir/$_gitname"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	cd "$srcdir/$_gitname"
	./autogen.sh
	./configure --prefix=/usr
	make
}

package() {
	cd "$srcdir/$_gitname"
	make DESTDIR="$pkgdir/" install
	install -Dm644 COPYING -t "$pkgdir/usr/share/licenses/$_gitname"
}
