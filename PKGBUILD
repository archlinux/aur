# Maintainer: Mathias Buhr <napcode@aparatus.de>
# Maintainer: redtide <redtid3@gmail.com>
# Contributor: Christopher Arndt <osam -at- chrisarndt -dot- de>

_pkgname=ConvertWithMoss
pkgname=${_pkgname,,}
pkgver=6.2.0
pkgrel=1
pkgdesc="A tool for converting multi-sample from one format to another."
url="https://mossgrabers.de/Software/ConvertWithMoss/ConvertWithMoss.html"
arch=(any)
license=(LGPL3)
groups=(pro-audio)
depends=(
  'java-runtime>=16'
  'java-openjfx'
)
makedepends=(maven)
source=(
  $pkgname-$pkgver.tar.gz::https://github.com/git-moss/ConvertWithMoss/archive/refs/tags/$pkgver.tar.gz
)
sha512sums=(
  'cd46866252b8447bd4034cdbbe971c842ef78d180c0d20c9589357400236997539441a122570f0c38d65943a1acc98abda8e17234eced3890f4ec3f232c77140'
)
prepare() (
  cd "$_pkgname-$pkgver"
  export MAVEN_OPTS=-Dmaven.repo.local="$srcdir/repository"
  # no matter what it seems Maven downloads everything with any command,
  # so download and build all at once in prepare() instead (no downloads in build())
  make
)
package() {
  cd "$_pkgname-$pkgver"
  export MAVEN_OPTS=-Dmaven.repo.local="$srcdir/repository"
  DESTDIR="${pkgdir}/" PREFIX=/usr make install
}
