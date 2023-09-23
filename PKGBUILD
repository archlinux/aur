# Maintainer:
# Contributor: Jay Ta'ala <jay@jaytaala.com>
# Contributor: Fredy García <frealgagu at gmail dot com>
# Contributor: Florent H. CARRÉ <colundrum@gmail.com>

_pkgname="skippy-xd"
pkgname="$_pkgname-git"
pkgver=2023.06.25.r17.g181b143
pkgrel=1
pkgdesc="A full-screen task-switcher for X11, similar to Apple's Expose."
arch=("i686" "x86_64")
url="https://github.com/dreamcat4/skippy-xd"
license=("GPL")
depends=(
  giflib
  libjpeg
  libxcomposite
  libxft
  libxinerama
  xorg-server
)

_pkgsrc="$_pkgname"
source=(
  "$_pkgname"::"git+$url"
)
sha256sums=(
  'SKIP'
)

if [ x"$pkgname" != x"$_pkgname" ] ; then
  makedepends+=(git)
  provides+=("$_pkgname")
  conflicts+=("$_pkgname")

  pkgver() {
  cd "$srcdir/$_pkgsrc"
    git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
  }
fi

build() {
  cd "$srcdir/$_pkgsrc"
  make PREFIX=/usr
}

package() {
  cd "$srcdir/$_pkgsrc"
  make DESTDIR="$pkgdir" install
}
