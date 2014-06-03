# Maintainer: carstene1ns <arch carsten-teibes de> - http://git.io/ctPKG
# Contributors: Florian Léger, chris_L, Sergej Pupykin, Zhukov Pavel

pkgname=dynamite-git
pkgver=r35.g9d268c9
pkgrel=1
pkgdesc="PKWARE Data Compression decompressor tool and library (development version)"
arch=('i686' 'x86_64')
url="https://github.com/twogood/dynamite"
license=("BSD")
provides=('dynamite' 'dynamite-svn')
conflicts=('dynamite')
depends=('glibc')
makedepends=("git")
source=(dynamite::"git+https://github.com/twogood/dynamite.git")
md5sums=('SKIP')

pkgver() {
  cd dynamite

  printf "r%s.g%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd dynamite

  ./bootstrap
  ./configure --prefix=/usr
  make
}

package() {
  cd dynamite

  make DESTDIR="$pkgdir" install
  install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
