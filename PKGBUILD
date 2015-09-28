# Maintainer: TingPing <tingping@tingping.se>

_gitname=gnome-battery-bench
pkgname=gnome-battery-bench-git
pkgver=3.15.4.r7.gfa60529
pkgrel=1
pkgdesc='Tool to measure power usage and estimates consumption and battery lifetime'
arch=('i686' 'x86_64' 'armv6h')
url='http://blog.fishsoup.net/2015/01/15/gnome-battery-bench/'
license=('GPL2')
depends=('gtk3' 'json-glib' 'libevdev' 'libxi' 'libxtst' 'polkit')
makedepends=('git' 'xmlto' 'asciidoc' 'autoconf' 'automake' 'gnome-common')
provides=('gnome-battery-bench')
conflicts=('gnome-battery-bench')
source=("git+https://git.gnome.org/browse/$_gitname")
md5sums=('SKIP')

pkgver() {
	cd "$_gitname"

	git describe --long | sed 's/^v//; s/-/.r/; s/-/./'
}

build() {
	cd "$srcdir/$_gitname"

	./autogen.sh --prefix=/usr --sysconfdir=/etc --libexec="/usr/lib/$_gitname"
	make -s
}

package() {
	cd "$srcdir/$_gitname"

	DESTDIR="$pkgdir" make install
}
