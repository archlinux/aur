# Maintainer: bilabila <bilabila@qq.com>
_pkgname=mygestures
pkgname=$_pkgname-git
pkgver=r250.2742a3f
pkgrel=1
pkgdesc='Mouse Gestures for Linux'
arch=(x86_64)
url=https://github.com/deters/mygestures
provides=($_pkgname)
conflicts=($_pkgname)
license=(custom)
depends=(libtool libx11 libxrender libxtst libxml2)
makedepends=(autoconf pkgconf make)
source=(git+https://github.com/deters/mygestures)
sha512sums=(SKIP)
pkgver() {
  cd $_pkgname
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}
build() {
  cd $_pkgname
  sh autogen.sh
  ./configure --prefix=/usr --sysconfdir=/etc/$_pkgname
  make
}
package() {
  install -Dm644 $_pkgname/mygestures.xml "$pkgdir"/etc/$_pkgname/mygestures.xml
  install -Dm755 $_pkgname/src/$_pkgname "$pkgdir"/usr/bin/$_pkgname
}
