# Contributor: Daniel Wallace <danielwallace at gtmanfred dot com>

pkgname=reptyr-git
pkgver=0.6.2.66.g3f46356
pkgrel=1
pkgdesc='Utility for taking an existing running program and attaching it to a new terminal'
arch=('x86_64')
license=('BSD')
url="https://github.com/nelhage/reptyr"
depends=('glibc')
makedepends=('git')
conflicts=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=("git+https://github.com/nelhage/${pkgname%-git}.git")
md5sums=('SKIP')

pkgver() {
  cd ${pkgname%-git}
  git describe --tags |sed 's+-+.+g'|sed 's+^reptyr.++'  
}

prepare() {
  cd ${pkgname%-git}
  sed -e 's/-Werror//' -i Makefile
}

build() {
  cd ${pkgname%-git}
  make
}

package() {
   cd ${pkgname%-git}
   make "DESTDIR=$pkgdir" "PREFIX=/usr" install
   install -Dm644 COPYING "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
} 
