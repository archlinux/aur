# Contributor: Joshua Taillon <jat255 AT gmail DOT com>
# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>

pkgname=imgcat-git
pkgver=2.5.0.r246.c69bebd
pkgrel=1
pkgdesc="It's like cat, but for images"
arch=('x86_64' 'i686' 'armv6h' 'armv7h' 'aarch64')
url="https://github.com/eddieantonio/imgcat"
license=('ISC')
depends=('ncurses' 'libjpeg' 'libpng')
makedepends=('cimg' 'git')  
source=("git+https://github.com/eddieantonio/${pkgname%-git}.git")
md5sums=('SKIP')

pkgver() {
  cd ${pkgname%-git}
  printf "%s.r%s.%s" "$(cat VERSION)" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd ${pkgname%-git}
  ./configure --prefix=/usr
  make PREFIX=/usr
}

package() {
  cd ${pkgname%-git}  
  make install PREFIX="$pkgdir"/usr
  install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
