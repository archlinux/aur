# Maintainer: Antoine Lubineau <antoine@lubignon.info>

pkgname=gti-git
pkgver=v1.8.0
pkgrel=1
pkgdesc='A silly git launcher'
arch=('i686' 'x86_64')
url='http://r-wos.org/hacks/gti'
license=('custom')
makedepends=('git')
provides=('gti')
conflicts=('gti')
source=('git+https://github.com/rwos/gti.git')
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/${pkgname%-git}"
  git describe --always | sed 's|-|.|g'
}

prepare() {
  cd "$srcdir/${pkgname%-git}"
  sed '/Copyright/,$! d' README.md > "$srcdir/LICENSE"
  sed -i "s/=install/=install -D/" Makefile
}

build() {
  cd "$srcdir/${pkgname%-git}"
  make
}

package() {
  cd "$srcdir/${pkgname%-git}"
  make DESTDIR="$pkgdir" install
  install -Dm644 "$srcdir/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

# vim:set ts=2 sw=2 et:
