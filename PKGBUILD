# Contributor: Lex Black <autumn-wind at web dot de>
# Contributor: Robin Martinjak <rob@rmartinjak.de>

_gitname=correcthorse
pkgname=correcthorse-git
pkgver=1.0.r23.g2a214af
pkgrel=4
pkgdesc="Passphrase generator based on https://xkcd.com/936/"
arch=('i686' 'x86_64')
url="https://github.com/rmartinjak/correcthorse"
license=('WTFPL')
depends=('glibc>=2.25')
makedepends=('git')
provides=('correcthorse')
conflicts=('correcthorse')
source=(git+https://github.com/rmartinjak/correcthorse.git
        change_prng.patch)
md5sums=('SKIP'
         '502d2efc2d46cc3c1a92a8245daa380a')


pkgver() {
  cd "$_gitname"
  git describe --long | sed 's/\([^-]*-g\)/r\1/;s/-/./g;s/v//'
}

prepare() {
  cd "$_gitname"
  patch -Np1 -i "${srcdir}/change_prng.patch"
}

build() {
  cd "$_gitname"
  make PREFIX=/usr
}

package() {
  cd "$_gitname"
  make DESTDIR="$pkgdir/" PREFIX=/usr install
}

# vim:set ts=2 sw=2 et:
