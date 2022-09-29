# Maintainer: Arvid Norlander <VorpalBlade (at) users DOT noreply DOT github DOT com>
pkgname=macutils-git
pkgver=v2.0b4.r0.58b0225
pkgrel=1
pkgdesc="Converting and decompressing some old Macintosh-oriented archive formats"
arch=(x86_64)
url="http://fileformats.archiveteam.org/wiki/Macutil"
license=('GPL')
makedepends=('git' 'meson')
source=('macutils::git+https://github.com/VorpalBlade/macutils#branch=modernization')
md5sums=('SKIP')

pkgver() {
	cd "$srcdir/${pkgname%-git}"
	printf "%s" "$(git describe --long | sed 's/\([^-]*-\)g/r\1/;s/-/./g')"
}

build() {
	cd "$srcdir"
	arch-meson "${pkgname%-git}" "build"
	meson compile -C "build"
}

package() {
	cd "$srcdir"
	meson install -C "build" --destdir "$pkgdir"
}
