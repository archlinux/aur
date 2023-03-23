# Maintainer: Dmitry Lyashuk <lyashuk.voxx at gmail dot com>
pkgname=k8jam
pkgver=r718.84bf025
pkgrel=1
pkgdesc="Fork of JAM build system, by ketmar"
arch=(x86_64 i686)
url="https://repo.or.cz/k8jam.git"
license=('GPL3')
makedepends=(git gcc)
provides=(k8jam)
source=(
  'git://repo.or.cz/k8jam.git'
)
md5sums=(
  'SKIP'
)


pkgver() {
  cd "$srcdir"/k8jam
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "$srcdir"/k8jam

  # First stage
  sh 0build.sh
  
  # Second stage
  bin.unix/k8jam config --prefix=/usr
  bin.unix/k8jam
}


package() {
  cd "$srcdir"/k8jam
  bin.unix/k8jam DESTDIR="$pkgdir" install
}
