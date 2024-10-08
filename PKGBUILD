# Maintainer: martini_lich <https://aur.archlinux.org/account/martini_lich>
# Upstream Author: Shaqeel Ahmad <https://github.com/ShaqeelAhmad>

pkgname='swiv-git'
_pkgname='swiv'
pkgver=0.1.r0.gc353580
pkgrel=2
pkgdesc="A fork of sxiv for wayland"
arch=('x86_64')
license=('GPL-2.0')
url="https://github.com/ShaqeelAhmad/${_pkgname}"
depends=('imlib2' 'cairo' 'fontconfig' 'pango' 'wayland' 'libxkbcommon')
optdepends=('giflib: gif support',
	    'libexif: parsing exif data')
makedepends=('git' 'wayland-protocols')
source=("git+https://github.com/ShaqeelAhmad/${_pkgname}.git")
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/$_pkgname"
  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "$srcdir/$_pkgname"
  make
}

package() {
  cd "$srcdir/$_pkgname"
  make PREFIX=/usr DESTDIR="$pkgdir" install
}
