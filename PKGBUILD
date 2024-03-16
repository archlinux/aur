# Maintainer: Mathias Buhr <napcode@aparatus.de>
# Maintainer: redtide <redtid3@gmail.com>
# Contributor: Christopher Arndt <osam -at- chrisarndt -dot- de>

_pkgname=ConvertWithMoss
pkgname=${_pkgname,,}
pkgver=7.5.0
pkgrel=1
pkgdesc="A tool for converting multi-sample from one format to another."
url="https://mossgrabers.de/Software/ConvertWithMoss/ConvertWithMoss.html"
arch=(any)
license=(LGPL3)
groups=(pro-audio)
depends=(
  'java-runtime>=17'
  'java-openjfx'
)
makedepends=(maven)
source=(
  $pkgname-$pkgver.tar.gz::https://github.com/git-moss/ConvertWithMoss/archive/refs/tags/$pkgver.tar.gz
)
sha512sums=('f705a55ab4c5fd04c6949ccc636386ed65c6c031cb5ba1ebdffe5cfef35007585b87cf0bbb19326ded908c2644c7e0f3d1a76250684f05236c3499bcbadf0510')
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
