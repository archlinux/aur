# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>

pkgname=stalin-git
pkgver=0.11.5.51.gb9abcf0
pkgrel=4
pkgdesc="brutally optimizing Scheme compiler, with Debianization patches from github"
arch=('i686' 'x86_64')
url="https://github.com/supergrade/stalin"
license=('GPL')
depends=('glibc')
makedepends=('git' 'gcc6')
provides=('stalin')
conflicts=('stalin')
source=("git+https://github.com/supergrade/stalin.git")
md5sums=('SKIP')
options=('!makeflags')
_gitname="stalin"

pkgver() {
  cd ${pkgname%-git}
  git describe --tags | sed 's|-|.|g' | cut -c8-
}

build() {
  cd ${pkgname%-git}
  ./build || true
}

package() {
  install -Dm644 ${pkgname%-git}/${pkgname%-git}.1 \
	  "$pkgdir"/usr/share/man/man1/${pkgname%-git}.1
  install -Dm755 ${pkgname%-git}/include/${pkgname%-git} \
	  "$pkgdir"/usr/bin/${pkgname%-git}
  install -Dm644 ${pkgname%-git}/README  \
	  "$pkgdir"/usr/share/doc/${pkgname%-git}/README
    
}
