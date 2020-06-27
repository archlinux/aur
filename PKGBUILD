# Maintainer: Dimitris Kiziridis <ragouel at outlook dot com>

pkgname=xxiivv-orca-git
pkgver=r988.105371b
pkgrel=1
pkgdesc="A two-dimensional esoteric programming language in which every letter of the alphabet is an operator"
arch=('x86_64')
url='https://wiki.xxiivv.com/site/orca.html'
license=('MIT')
provides=('xxiivv-orca')
depends=('ncurses'
         'portmidi')
makedepends=('git' 'portmidi')
source=("${pkgname%-git}::git+https://git.sr.ht/~rabbits/orca")
sha256sums=('SKIP')

pkgver() {
  cd "${pkgname%-git}"
  echo "r$(git rev-list --count HEAD).$(git rev-parse --short HEAD)"
}

build() {
  cd "${pkgname%-git}"
  make
}

package() {
  cd "${pkgname%-git}"
  install -Dm755 build/orca "${pkgdir}/usr/bin/xxiivv-orca"
  install -Dm644 LICENSE.md "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -d "${pkgdir}/usr/share/doc/${pkgname}"
  cp -R examples "${pkgdir}/usr/share/doc/${pkgname}"
}