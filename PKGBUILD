# Maintainer: Mathias Buhr <napcode@aparatus.de>
# Maintainer: redtide <redtid3@gmail.com>
# Contributor: Christopher Arndt <osam -at- chrisarndt -dot- de>

_pkgname=ConvertWithMoss
pkgname=${_pkgname,,}
pkgver=6.2.1
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
sha512sums=('b0cf7d98c05a0653351a97a2d5ef5a8f398765fa1036c0c2433248c5515a7928d4cd892e128ece948506d226acea2d9f5a1dda776ef890b8cf60a66695d61bf3')
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
