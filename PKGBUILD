# Maintainer: Radek Podgorny <radek@podgorny.cz>

pkgname='planck-git'
provides=('planck')
conflicts=('planck')
pkgver=r1579.47b9eec
pkgrel=1
pkgdesc="A stand-alone ClojureScript REPL"
arch=('x86_64')
url="http://planck-repl.org/"
depends=('webkit2gtk' 'libzip' 'zlib')
makedepends=('git' 'java-environment' 'cmake' 'maven' 'leiningen')
license=('EPL-1.0')
source=(
  "$pkgname::git+https://github.com/mfikes/planck"
)
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/$pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "$srcdir/$pkgname"
  script/build
}

package() {
  cd "$srcdir/$pkgname"
  install -Dm755 "$srcdir/$pkgname/planck-c/build/planck" "$pkgdir/usr/bin/planck"
  install -Dm755 "$srcdir/$pkgname/planck-sh/plk" "$pkgdir/usr/bin/plk"
}
