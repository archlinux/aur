# Maintainer: Radek Podgorny <radek@podgorny.cz>

pkgname='planck'
conflicts=('planck-git')
pkgver=2.25.0
pkgrel=1
_pkgnamever=${pkgname}-${pkgver}
pkgdesc="A stand-alone ClojureScript REPL"
arch=('x86_64')
url="http://planck-repl.org/"
depends=('webkit2gtk' 'libzip' 'zlib')
makedepends=('java-environment' 'cmake' 'clojure' 'leiningen' 'unzip' 'vim')
license=('EPL-1.0')
source=(
  https://github.com/planck-repl/${pkgname}/archive/${pkgver}.tar.gz
)
sha256sums=('58a3f9b0e3d776bc4e28f1e78a8ce6ab1d98149bebeb5c5328cc14345b925a1f')

build() {
  cd "$srcdir/${_pkgnamever}"
  sed 's_lib/closure_lib/closure/goog_' -i planck-cljs/script/build.clj
  script/build
}

package() {
  cd "$srcdir/${_pkgnamever}"
  install -Dm755 "$srcdir/${_pkgnamever}/planck-c/build/planck" "$pkgdir/usr/bin/planck"
}
