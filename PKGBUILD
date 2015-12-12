# Maintainer: xomachine <xomachiner@gmail.com>
pkgname=termit-git
pkgver=version.2.5.0.r137.gc53f3c5
pkgrel=1
pkgdesc="Terminal emulator based on VTE library with Lua scripting"
conflicts=("termit")
arch=('i686' 'x86_64')
url="https://github.com/nonstop/termit"
license=('GPL')
depends=("lua" "vte>=0.28")
makedepends=("git" "cmake>=2.4")
source=("termit::git+https://github.com/nonstop/termit.git")
md5sums=('SKIP')

pkgver() {
  _pkgname=$(echo $pkgname | sed -e 's/-git$//')
  cd "$srcdir/$_pkgname"
  ( set -o pipefail
    git describe --long 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  )
}

build() {
  _pkgname=$(echo $pkgname | sed -e 's/-git$//')
  cd "$srcdir/$_pkgname"
  cmake -DCMAKE_INSTALL_PREFIX=/usr .
  make
}
package ()
{
  _pkgname=$(echo $pkgname | sed -e 's/-git$//')
  cd "$srcdir/$_pkgname"
  make DESTDIR="$pkgdir" install
}

# vim:set ts=2 sw=2 et:
