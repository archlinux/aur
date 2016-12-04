# Maintainer: Radek Podgorny <radek@podgorny.cz>

pkgname='planck-git'
provides=('planck')
conflicts=('planck')
pkgver=r1067.b818bb8
pkgrel=1
pkgdesc="A stand-alone ClojureScript REPL"
arch=('x86_64')
url="http://planck-repl.org/"
depends=('webkitgtk' 'libzip' 'zlib')
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
}
