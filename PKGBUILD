# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>
# Contributor: Jack Random, <jack(at)random(dot)to>
# previous: csllbr; Popsch <popsch@gmx.net>
# Thanks to the maintainers and contributors of the mu binary package

pkgname=mu-git
pkgver=1.7.0.r5558
pkgrel=2
epoch=1
pkgdesc="mu and mu4e from git"
arch=('i686' 'x86_64')
url="http://www.djcbsoftware.nl/code/mu"
depends=('xapian-core' 'gmime3')
makedepends=('git' 'meson')
optdepends=('emacs: mu4e support' 'guile: to script in guile')
license=('GPL')
provides=('mu')
conflicts=('mu')
source=('git+https://github.com/djcb/mu.git')
md5sums=('SKIP')

pkgver() {
  cd mu
  printf %s.r%s $(awk '/version:/ {print $2}' meson.build|head -1|tr -d \' | tr -d \,) $(git rev-list --count HEAD)
}

build() {
  cd mu
  meson --prefix=/usr --buildtype=plain build 
  ninja -C build
}

package() {
  cd mu
  DESTDIR="$pkgdir" ninja -C build install
}
