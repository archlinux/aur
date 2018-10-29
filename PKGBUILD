# Maintainer: Martin Müllenhaupt <mm+aur.archlinux.org@netlair.de>
pkgname=faf-ice-adapter-java
pkgver=1.1.0
pkgrel=1
epoch=0
pkgdesc="A P2P connection proxy for Supreme Commander: Forged Alliance using ICE"
url="http://www.faforever.com/"
arch=('any')
license=('GPL3')
groups=()
depends=('jre8-openjdk')
makedepends=('jdk8-openjdk' 'gradle')
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
sha256sums=('SKIP' '6b5e2809751a7bb230a2f338398178c53acbf8df884efc57717d9c4e1e842175')
noextract=()
validpgpkeys=()

pkgver() {
  cd "java-ice-adapter"
  git describe --tags --abbrev=0 | cut -d v -f 2 | sed 's/-/./g'
}

build() {
  gradle -b java-ice-adapter/ice-adapter/build.gradle shadowJar
}

package() {
  install -D "java-ice-adapter/ice-adapter/build/libs/ice-adapter-SNAPSHOT-all.jar" "$pkgdir/usr/share/java/faf-ice-adapter/faf-ice-adapter.jar"
  install -D "$srcdir/faf-ice-adapter" "$pkgdir/usr/bin/faf-ice-adapter"
}
