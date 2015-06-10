# Contributor: Alexander Rødseth <rodseth@gmail.com>
pkgname=nweb
pkgver=23
pkgrel=1
pkgdesc='Tiny web server for serving static pages'
arch=('x86_64' 'i686')
url='http://www.ibm.com/developerworks/systems/library/es-nweb.html'
license=('custom')
makedepends=('lynx')
source=('http://public.dhe.ibm.com/systems/power/community/aix/nweb/nweb.zip')
sha256sums=('21cc9941cf8b108d109e93c824ca4b19149d01f31134536bec33b21fc73b57e3')

prepare() {
  lynx --dump 'http://www.ibm.com/developerworks/apps/download/index.jsp?contentid=446318&filename=es-nweb.zip&method=http' \
    | head -114 | tail -108 > LICENSE
}

build() {
  gcc -std=c11 -O3 -DLINUX nweb23.c -o nweb -w
}

package() {
  install -Dm755 nweb "$pkgdir/usr/bin/nweb"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

# vim:set ts=2 sw=2 et:
