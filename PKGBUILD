# Contributor: Dave Reisner <d@falconindy.com>

pkgname=pkgfile-git
pkgver=18
pkgrel=1
pkgdesc="a pacman .files metadata explorer"
arch=('x86_64' 'i686')
url="http://github.com/falconindy/pkgfile"
license=('MIT')
depends=('libarchive' 'curl' 'pcre' 'pacman')
makedepends=('git' 'perl' 'meson')
conflicts=('pkgfile')
provides=('pkgfile')
install=pkgfile.install
source=("git+https://github.com/falconindy/pkgfile")
md5sums=('SKIP')

pkgver() {
  cd pkgfile

  git describe | sed 's/^v//;s/-/./g'
}

prepare() {
  cd pkgfile

  meson build -D buildtype=release
}

build() {
  cd pkgfile

  ninja -C build
}

package() {
  cd pkgfile

  DESTDIR="$pkgdir" ninja -C build install
}

# vim: ft=sh syn=sh et
