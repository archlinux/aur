# Maintainer: Mathias Buhr <napcode@aparatus.de>
# Maintainer: redtide <redtid3@gmail.com>
# Contributor: Christopher Arndt <osam -at- chrisarndt -dot- de>

_pkgname=ConvertWithMoss
pkgname=${_pkgname,,}
pkgver=6.3.0
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
sha512sums=('7c739f93b5c50d67369f2e0f75ef0c312d8ffef65ef42e497daa20359bf048835bc122365796ecf680b2ef1eb1ad707a5ffa4d0e4b8978c824e04e12cea5f42c')
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
