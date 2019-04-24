# Maintainer: Martin Müllenhaupt <mm+aur.archlinux.org@netlair.de>
pkgname=faf-ice-adapter-java
pkgver=2.3.0
pkgrel=1
epoch=0
pkgdesc="A P2P connection proxy for Supreme Commander: Forged Alliance using ICE"
url="http://www.faforever.com/"
arch=('any')
license=('GPL3')
groups=()
depends=('jre8-openjdk')
makedepends=('java-openjfx' 'gradle')
checkdepends=()
optdepends=()
provides=('faf-ice-adapter')
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=("git+https://github.com/FAForever/java-ice-adapter.git" 'faf-ice-adapter')
sha256sums=('SKIP' '2753364cb2fe87ce39c46d8ef2ba265189465164afd24a2329b81feb9bd2c6f7')
noextract=()
validpgpkeys=()

pkgver() {
  cd "java-ice-adapter"
  git describe --tags --abbrev=0 | cut -d v -f 2 | sed 's/-/./g'
}

build() {
  gradle -Dorg.gradle.java.home=/usr/lib/jvm/java-8-openjdk -b java-ice-adapter/ice-adapter/build.gradle shadowJar
}

package() {
  install -D "java-ice-adapter/ice-adapter/build/libs/ice-adapter-SNAPSHOT.jar" "$pkgdir/usr/share/java/faf-ice-adapter/faf-ice-adapter.jar"
  install -D "$srcdir/faf-ice-adapter" "$pkgdir/usr/bin/faf-ice-adapter"
}
