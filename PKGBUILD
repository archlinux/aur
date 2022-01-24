# Maintainer: Ye Jingchen <ye[dot]jingchen[at]gmail[dot]com>

_pkgname=edgar
pkgname=edgar-git
pkgver=r72.250957a
pkgrel=1
pkgdesc="Load Python gadgets in Enlightenment"
arch=('x86_64' 'i686')
url="https://phab.enlightenment.org/w/emodules/edgar/"
license=('GPL3' 'LGPL3')
depends=('enlightenment>=0.24' 'python>=3.5' 'python-efl>=1.11' 'python-dbus'
         'python-psutil')
makedepends=('git' 'meson')
provides=(edgar)
conflicts=(edgar)
source=("git+https://git.enlightenment.org/enlightenment/modules/$_pkgname.git")
md5sums=('SKIP')

pkgver() {
	cd "$srcdir/$_pkgname"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

build() {
	arch-meson $_pkgname build
	meson compile -C build
}

package() {
	DESTDIR="$pkgdir" meson install -C build
}
