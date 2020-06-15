# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>
pkgname=fzy-git
pkgver=1.0.r38.gc2d816d
pkgrel=1
pkgdesc="A fuzzy text selector menu for the terminal"
arch=('i686' 'x86_64')
url="https://github.com/jhawthorn/fzy"
license=('custom:MIT')
depends=('glibc')
makedepends=('git')
provides=('fzy')
conflicts=('fzy')
source=("git+https://github.com/jhawthorn/fzy.git")
md5sums=('SKIP')

pkgver() {
  cd ${pkgname%-git}
  git describe --tags | sed "s+-+.r+" | tr - .
}

build() {
  cd ${pkgname%-git}
  make PREFIX=/usr
}

package() {
  cd ${pkgname%-git}
  make PREFIX=/usr DESTDIR="$pkgdir/" install
  install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
