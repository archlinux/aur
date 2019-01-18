# Maintainer: anergy <anergy dot 25110321 at gmail dot com>

_pkgname=chibi-scheme
pkgname=chibi-scheme-git
pkgver=0.7.3.r658.g677ccdce
pkgrel=1
pkgdesc="minimal R7RS scheme implementation for use as an extension language"
arch=('x86_64' 'i686')
url="https://github.com/ashinn/chibi-scheme"
license=('GPL')
groups=()
depends=('glibc')
makedepends=('git')
provides=(chibi-scheme)
conflicts=(chibi-scheme)
replaces=()
backup=()
options=()
install=
source=(git+https://github.com/ashinn/chibi-scheme)
noextract=()
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/$_pkgname"
  git describe --long | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "$srcdir/$_pkgname"
  make PREFIX="/usr" || return 1
}

package() {
  cd "$srcdir/$_pkgname"
  make DESTDIR="$pkgdir" PREFIX="/usr" install
}

check() {
  cd "$srcdir/$_pkgname"
  make test || return 1
}

# vim:set ts=2 sw=2 et:
