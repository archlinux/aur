# Maintainer: William Luc Ritchie <luc dot ritchie at gmail dot com>

_pkgname=fernflower
pkgname=$_pkgname-git
pkgver=r449.1cdee1f
pkgrel=1
pkgdesc='An analytical decompiler for Java'
arch=('any')
url='https://github.com/fesh0r/fernflower'
license=('Apache')
depends=('java-runtime')
makedepends=('git' 'apache-ant')
source=("git+$url")
sha256sums=('SKIP')

pkgver() {
  cd $_pkgname
  printf 'r%s.%s' "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd $_pkgname
  ./gradlew jar
}

package() {
  cd $_pkgname
  install -Dm644 "build/libs/$_pkgname.jar" "$pkgdir/usr/share/java/$_pkgname/$pkgname.jar"
  install -d "$pkgdir/usr/bin"
  printf '#!/bin/sh\nexec java -jar /usr/share/java/%s/%s.jar "$@"\n' $_pkgname $pkgname > "$pkgdir/usr/bin/$_pkgname"
  chmod 755 "$pkgdir/usr/bin/$_pkgname"
}
