# Maintainer: Lukas Sabota <lukas@lwsabota.com>
# Contributor: Lukas Sabota <lukas@lwsabota.com>
pkgname=blastem-hg
pkgver=r682.7ed1dbb48f61
pkgrel=2
pkgdesc="Fast and accurate Sega Genesis/Mega Drive emulator"
arch=('x86_64')
url="http://rhope.retrodev.com/files/blastem.html"
license=('GPLv3')
groups=()
depends=('sdl')
makedepends=('mercurial')
provides=('blastem')
conflicts=('blastem')
replaces=()
backup=()
options=()
install=
source=(blastem::hg+http://rhope.retrodev.com/repos/blastem)
sha256sums=('SKIP')
_hgrepo="blastem"

pkgver() {
  cd $srcdir/$_hgrepo
  printf "r%s.%s" "$(hg identify -n)" "$(hg identify -i)"
}


build() {
  cd $srcdir
  rm -rf "$srcdir/$_hgrepo-build"
  cp -r "$srcdir/$_hgrepo" "$srcdir/$_hgrepo-build"
  cd "$srcdir/$_hgrepo-build"
  make blastem
}


package() {
  cd "$srcdir/$_hgrepo-build"
  install -Dm 755 blastem $pkgdir/usr/bin/blastem
}

# vim:set ts=2 sw=2 et:
