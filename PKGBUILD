# Maintainer: Maxwell Zhao <thepiercingarrow@protonmail.com>
pkgname=quark-git
pkgver=r100.29d53f6
pkgrel=1
pkgdesc="An extremly small and simple http get-only web server. It only serves static pages on a single host."
arch=('i686' 'x86_64' 'armv6h')
url="http://tools.suckless.org/quark"
license=('custom:ISC')
depends=('glibc')
makedepends=('git')
provides=('quark')
conflicts=('quark')
source=("$pkgname::git+http://git.suckless.org/quark")
md5sums=('SKIP')
sha1sums=('SKIP')

pkgver() {
  cd "$srcdir/$pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  cd "$srcdir/$pkgname"
  if [[ -f "$SRCDEST/$pkgname/config.h" ]]; then
    cp -f "$SRCDEST/$pkgname/config.h" config.h
  fi
}

build() {
  cd "$srcdir/$pkgname"
  make PREFIX=/usr
}

package() {
  cd "$srcdir/$pkgname"
  make PREFIX=/usr DESTDIR=$pkgdir install
  install -Dm644 LICENSE $pkgdir/usr/share/licenses/$pkgname/LICENSE
}
