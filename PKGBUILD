# Maintainer: 
# Based on Aaron Paden <aaronbpaden@gmail.com> PKGBUILD for pcem
pkgname=pcem-hg
_pkgname=pcem
pkgver=r1567.457d2fe0975a
pkgrel=1
pkgdesc="Emulator for various IBM PC computers and clones - development version"
url="http://pcem-emulator.co.uk/"
arch=('x86_64' 'i686')
license=('GPL2')
depends=('wxgtk2' 'openal' 'sdl2')
makedepends=('mercurial' 'automake-1.15')
conflicts=('pcem')
source=("hg+https://bitbucket.org/pcem_emulator/pcem")
sha256sums=('SKIP')

pkgver() {
  cd "$_pkgname"
  printf "r%s.%s" "$(hg identify -n)" "$(hg identify -i)"
}

build() {
  cd "${srcdir}/pcem"
  aclocal-1.15
  ./configure --enable-release-build --enable-networking --prefix=/usr
  make
}

package() {
  cd "${srcdir}/pcem"
  make DESTDIR="${pkgdir}" install
  install -Dm644 COPYING "$pkgdir/usr/share/licenses/$pkgname/COPYING"
}

# vim:set ts=2 sw=2 et:

