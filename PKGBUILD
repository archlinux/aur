# Maintainer: Jean Lucas <jean@4ray.co>

pkgname=mellite
pkgver=2.24.0
pkgrel=1
pkgdesc='Graphical front-end for the SoundProcesses computer music framework'
arch=(i686 x86_64)
url=https://sciss.github.io/Mellite
license=(GPL3)
depends=(java-environment supercollider)
makedepends=(sbt)
conflicts=(mellite-git)
source=(https://github.com/Sciss/Mellite/archive/v$pkgver.tar.gz)
sha512sums=(c82a7e0d942fd957484665b7bd511e621146599b9586290e23fc7f2e762dad7e408f253072d98e5cfdbc002313fa6beb3e7f00cb724cfb5ed697c9313a208c00)

build() {
  cd Mellite-$pkgver
  sbt assembly
}

package() {
  install -D ../mellite.sh "$pkgdir"/usr/bin/mellite
  cd Mellite-$pkgver
  install -Dm 644 Mellite.jar "$pkgdir"/usr/share/mellite/mellite.jar
  install -Dm 644 src/debian/Mellite.desktop "$pkgdir"/usr/share/applications/mellite.desktop
  sed -i 's#share/mellite/##;s#Mellite.png#share/pixmaps/mellite.png#' "$pkgdir"/usr/share/applications/mellite.desktop
  install -Dm 644 icons/application.png "$pkgdir"/usr/share/pixmaps/mellite.png
  install -Dm 644 LICENSE "$pkgdir"/usr/share/licenses/mellite/LICENSE
}
