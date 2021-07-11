pkgname=silentjack-git
pkgver=20.f4aa303
pkgrel=3
pkgdesc='SilentJack is a silence/dead air detector for the Jack Audio Connection Kit.'
arch=('i686' 'x86_64' 'armv7h')
url='https://github.com/njh/silentjack'
license=('GPL')
depends=('jack')
provides=('silentjack')
conflicts=('silentjack')
makedepends=('git')
source=('git+https://github.com/njh/silentjack')
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/silentjack"
  echo $(git rev-list --count HEAD).$(git rev-parse --short HEAD)
}

build() {
  cd "$srcdir/silentjack"
  ./autogen.sh
  ./configure --prefix=/usr
  make
}

package() {
  cd "$srcdir/silentjack"
  make DESTDIR="$pkgdir/" install
}
