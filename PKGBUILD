# Maintainer: ferreum <code.danielk at gmail com>
pkgname=i3-match-git
pkgver=0.1.34.r6bce2d9
pkgrel=1
pkgdesc="Match and query i3 window properties and events"
arch=('i686' 'x86_64')
url='https://github.com/ferreum/i3-match'
license=('BSD')
depends=('xcb-util' 'yajl')
makedepends=('i3-wm')
source=('git://github.com/ferreum/i3-match')
sha1sums=('SKIP')

_gitname='i3-match'

pkgver() {
  cd "$srcdir/$_gitname"
  local ver="0.1.$(git rev-list --count HEAD).r$(git rev-parse --short HEAD)"
  printf "%s" "${ver//-/.}"
}

prepare() {
  cd "$_gitname/src"
  make clean
  make depend
}

build() {
  cd "$_gitname/src"
  make
}

package() {
  cd "$_gitname"

  install -Dm755 -t "${pkgdir}/usr/bin/" "src/i3-match"
  install -Dm644 -t "${pkgdir}/usr/share/man/man1/" man/*.1
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

# vim:set ts=2 sw=2 et:

