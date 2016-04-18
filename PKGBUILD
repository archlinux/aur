# Maintainer: Markus Opitz <mastero23 at gmail dot com>

pkgname=henplus
fragment=1676541
pkgver=0.9.8.$fragment
pkgrel=2
pkgdesc="SQL shell written in Java"
arch=('i686' 'x86_64')
url="http://henplus.sourceforge.net/"
license=('GPL')
depends=('java-environment' 'bash')
makedepends=('apache-ant')
install=henplus.install
source=("${pkgname}::git+https://github.com/neurolabs/henplus.git#commit=${fragment}")
md5sums=(SKIP)

build() {
  cd $srcdir/$pkgname &&
  ant jar
}

package() {
  cd "$srcdir/$pkgname" && (
  set -e
  mkdir -p "$pkgdir/usr/share/java/henplus/"
  cp lib/commons-cli-1.2.jar lib/libreadline-java-0.8.0.jar \
    build/henplus.jar "$pkgdir/usr/share/java/henplus/"
  install -D doc/HenPlus.html "$pkgdir/usr/share/doc/henplus/HenPlus.html"
  install -D -m 755 "$startdir/henplus.sh" "$pkgdir/usr/bin/henplus"
  )
}
