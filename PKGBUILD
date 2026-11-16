# Maintainer: Mike Pento <mjpento@gmail.com> 

_pkgname=enlightenment-module-edgar
pkgname=edgar-git
pkgver=r73.3be11c2
pkgrel=2
pkgdesc="Load Python gadgets in Enlightenment"
arch=('x86_64' 'i686')
url="https://phab.enlightenment.org/w/emodules/edgar/"
license=('GPL-3.0-only')
depends=('glibc' 'efl' 'enlightenment>=0.24' 'python>=3.5' 'python-dbus' 'python-efl>=1.11')
makedepends=('git' 'meson')
provides=(edgar)
conflicts=(edgar)
options+=('!debug')
source=("git+https://git.enlightenment.org/enlightenment/${_pkgname}.git")
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
