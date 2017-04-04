# Contributor: Lex Black <autumn-wind at web dot de>
# Contributor: Robin Martinjak <rob@rmartinjak.de>

_gitname=correcthorse
pkgname=correcthorse-git
pkgver=1.0.r23.g2a214af
pkgrel=2
pkgdesc="Passphrase generator based on https://xkcd.com/936/"
arch=('i686' 'x86_64')
url="https://github.com/rmartinjak/correcthorse"
license=('WTFPL')
depends=('glibc>=2.25')
makedepends=('git')
provides=('correcthorse')
conflicts=('correcthorse')
source=(git://github.com/rmartinjak/correcthorse.git
        seed.patch)
md5sums=('SKIP'
         '34c953a35b1cb563d571005d62c3d199')


pkgver() {
  cd "$_gitname"

  git describe --long | sed 's/\([^-]*-g\)/r\1/;s/-/./g;s/v//'
}

prepare() {
  cd "$_gitname"

  patch -Np1 -i "${srcdir}/seed.patch"
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
