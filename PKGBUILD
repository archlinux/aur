# Maintainer: Krystian Chachuła <krystiancha@gmail.com>

pkgname=dex-protecto-git
pkgver=r84.bd85b78
pkgrel=1

pkgdesc="Program to generate and execute DesktopEntry files of type Application, protecto's fork"
url='https://github.com/protecto/dex'
arch=('any')
license=('GPL2')

depends=('python')
makedepends=('git' 'python-sphinx')

provides=('dex')
conflicts=('dex' 'dex-git')

source=("git+https://github.com/protecto/dex.git"
        fix-dex-version.patch)

md5sums=('SKIP'
         'f2be2e9ea5f6317f89bd07af1cfe5565')

pkgver() {
  cd "$srcdir/${pkgname%-protecto-git}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  cd dex
  patch dex <"$srcdir"/fix-dex-version.patch
}

package() {
  cd dex
  make install PREFIX=/usr MANPREFIX=/usr/share/man DESTDIR="$pkgdir"
  rm "$pkgdir/usr/share/doc/dex/LICENSE"
}

# vim:set ts=2 sw=2 et:
