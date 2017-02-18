# Maintainer: Nick Østergaard <oe.nick at gmail.com>
pkgname=flyby-git
pkgver=r472.138d2e3
pkgrel=1
pkgdesc="A satellite tracking program"
arch=('i686' 'x86_64' 'arm')
url="https://github.com/la1k/flyby"
license=('GPL')
makedepends=('git')
depends=('bash' 'libpredict-git')
provides=('flyby')
replaces=('flyby')
source=("$pkgname::git+https://github.com/la1k/flyby")
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/$pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "$srcdir/$pkgname"

  cmake .
  make
}

package() {
  cd "$srcdir/$pkgname"
  make DESTDIR="$pkgdir" install
  mkdir -p $pkgdir/usr/bin
  cp update-tle $pkgdir/usr/bin/ # Bash needed for this script
}

# vim:set ts=2 sw=2 et:

