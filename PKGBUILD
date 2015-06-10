# Maintainer: Buce <dmbuce@gmail.com>

pkgname=minecraft-map-auto-trim-git
pkgver=0.r25.g69adce0
pkgver() {
  cd "$srcdir/$pkgname"
  if ! git describe --tags 2>/dev/null; then
    echo "0.r$(git rev-list --count HEAD).g$(git rev-parse --short HEAD)"
  fi | sed 's/-/.r/; s/-/./g'
}
pkgrel=1
pkgdesc="Delete unecessary minecraft chunks."
arch=(any)
url="https://github.com/hwei/Minecraft-Map-Auto-Trim"
license=('Apache')
depends=('java-environment' 'bash')
makedepends=('git' 'findutils' 'java-environment')
provides=( mmat minecraft-map-auto-trim)
conflicts=(mmat minecraft-map-auto-trim)
replaces=()
source=("$pkgname::git://github.com/hwei/Minecraft-Map-Auto-Trim.git"
        mmat.sh)
md5sums=('SKIP'
         'ff6d7ad70f0bb1baacdb03c6b6b2cad8')

build() {
  cd "$srcdir/$pkgname/src"

  javac $(find . -name \*.java)
  jar -cvfe "../mmat.jar" me.hwei.mctool.MapAutoTrim $(find . -name \*.class)

}

package() {
  cd "$srcdir"
  install -D -m644 "$pkgname/mmat.jar" "$pkgdir/usr/share/java/minecraft-map-auto-trim/mmat.jar"
  install -D -m755 mmat.sh "$pkgdir/usr/bin/mmat"
}

# vim:set ts=2 sw=2 et:
