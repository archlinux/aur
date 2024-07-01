# Maintainer: Nick Østergaard <oe.nick@gmail.com>
# Co-maintainer: Kristopher James Kent <aur@kjkent.dev>
# Contributor: Martin Hundebøll <martin@hundeboll.net>

pkgname='tio-git'
_pkgname="${pkgname%%-git}"
pkgver='3.5.r1.g02cac07'
pkgrel=1
pkgdesc='A serial device I/O tool'
url='https://github.com/tio/tio'
arch=('x86_64' 'i686')
license=('GPL-2.0-or-later')
conflicts=("$_pkgname")
provides=("$_pkgname")
depends=('glib2' 'lua')
makedepends=('git' 'meson')
source=("git+$url.git")
sha256sums=('SKIP')

pkgver() {
  cd "$_pkgname"
  git describe --tags --long | sed -r 's/^v//;s/([^-]*-g)/r\1/;s/-/./g'
}

build() {
  cd "$srcdir/$_pkgname"
  meson setup --prefix=/usr --buildtype=plain . build
  meson compile -C build
}

package() {
  cd "$srcdir/$_pkgname"
  meson install -C build --destdir "$pkgdir"
}

# vim:set ts=2 sw=2 et:
