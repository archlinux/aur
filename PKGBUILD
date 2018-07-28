# Maintainer: Jean Lucas <jean@4ray.co>

pkgname=mellite-git
pkgver=2.24.0
pkgrel=1
pkgdesc='Graphical front-end for the SoundProcesses computer music framework (git)'
arch=(i686 x86_64)
url=https://sciss.github.io/Mellite
license=(GPL3)
depends=(java-environment supercollider)
makedepends=(git sbt)
provides=(mellite)
conflicts=(mellite)
source=(git+https://github.com/Sciss/Mellite)
sha512sums=(SKIP)

pkgver() {
  cd Mellite
  git describe --tags | sed 's/v//;s/-/+/g'
}

build() {
  cd Mellite
  sbt assembly
}

package() {
  install -D ../mellite.sh "$pkgdir"/usr/bin/mellite
  cd Mellite
  install -Dm 644 Mellite.jar "$pkgdir"/usr/share/mellite/mellite.jar
  install -Dm 644 src/debian/Mellite.desktop "$pkgdir"/usr/share/applications/mellite.desktop
  sed -i 's#share/mellite/##;s#Mellite.png#pixmaps/mellite.png#' "$pkgdir"/usr/share/applications/mellite.desktop
  install -Dm 644 icons/application.png "$pkgdir"/usr/share/pixmaps/mellite.png
  install -Dm 644 LICENSE "$pkgdir"/usr/share/licenses/mellite/LICENSE
}
