# Maintainer: Viktor Drobot (aka dviktor) linux776 [at] gmail [dot] com
pkgname=fpocket-git
pkgver=3.1.2
pkgrel=1
pkgdesc="Fpocket is a very fast open source protein pocket detection algorithm based on Voronoi tessellation"
arch=('i686' 'x86_64')
license=('MIT')
url="https://github.com/Discngine/fpocket"
makedepends=('git' 'patch')
source=("git+https://github.com/Discngine/fpocket.git"
        "fpocket.patch")
sha1sums=('SKIP'
          '376060e821c23483effa2befb6e090d81dcc4d5e')

prepare() {
  cd ${srcdir}/fpocket
  patch -Np0 -i "${srcdir}/fpocket.patch"
}

build() {
  cd ${srcdir}/fpocket
  
  make
}

package() {
  mkdir -p ${pkgdir}/usr/bin
  mkdir -p ${pkgdir}/usr/share/man/man8

  cd ${srcdir}/fpocket

  install -Dm755 bin/fpocket ${pkgdir}/usr/bin/fpocket
  install -Dm755 bin/dpocket ${pkgdir}/usr/bin/dpocket
  install -Dm755 bin/tpocket ${pkgdir}/usr/bin/tpocket
  install -Dm755 bin/mdpocket ${pkgdir}/usr/bin/mdpocket
  install -Dm644 man/fpocket.8 ${pkgdir}/usr/share/man/man8/fpocket.8
  install -Dm644 man/dpocket.8 ${pkgdir}/usr/share/man/man8/dpocket.8
  install -Dm644 man/tpocket.8 ${pkgdir}/usr/share/man/man8/tpocket.8
}
