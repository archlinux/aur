# Maintainer: redtide <redtid3@gmail.com>

_pkgname=convertwithmoss
pkgname=$_pkgname-git
pkgver=r118.ca9732a
pkgrel=1
pkgdesc="A tool for converting multi-sample from one format to another."
url=https://mossgrabers.de/Software/ConvertWithMoss/ConvertWithMoss.html
arch=(any)
license=(LGPL3)
groups=(pro-audio)
depends=(
  'java-runtime>=16'
  java-openjfx
)
makedepends=(
  git
  maven
)
source=($_pkgname::git+https://github.com/git-moss/ConvertWithMoss)
sha512sums=(SKIP)

provides=($_pkgname)
conflicts=($_pkgname)

pkgver() {
  cd "$srcdir/$_pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "$srcdir/$_pkgname"
  export MAVEN_OPTS=-Dmaven.repo.local="$srcdir/repository"
  make
}

package() {
  cd "$srcdir/$_pkgname"
  export MAVEN_OPTS=-Dmaven.repo.local="$srcdir/repository"
  DESTDIR="$pkgdir/" PREFIX=/usr make install
}
