# Contriibutor: Alexander F. Rødseth <xyproto@archlinux.org>
# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>

pkgname=goya
pkgver=0.0.9a.r.2dba18e6b3
pkgrel=1
_commit=2dba18e
pkgdesc='Pixel art editor'
arch=('any')
url='https://github.com/jackschaedler/goya'
license=(EPL)
depends=('xdg-utils')
makedepends=('git' 'leiningen' 'clojure')
source=("git+$url#commit=$_commit")
sha256sums=('SKIP')

pkgver() {
  cd $pkgname
  printf %s.r.%s $(grep .version src/cljs/$pkgname/appstate.cljs | cut -d\" -f2|cut -c2-) $(git rev-parse HEAD | cut -b-10)
}

prepare() {
  echo -e '#!/bin/sh\nxdg-open /usr/share/goya/resources/index.html' > goya.sh
}

build() {
  cd $pkgname
  lein compile
}

package() {
  cd $pkgname
  install -d "$pkgdir/usr/share/goya"
  cp -r resources "$pkgdir/usr/share/goya/"
  install -Dm755 ../goya.sh "$pkgdir/usr/bin/goya"
}

