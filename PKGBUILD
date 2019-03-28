# Maintainer: Viktor Drobot (aka dviktor) linux776 [at] gmail [dot] com
pkgname=fpocket-git
pkgver=r84.d9012c1
pkgrel=1
pkgdesc="Fpocket is a very fast open source protein pocket detection algorithm based on Voronoi tessellation"
arch=('i686' 'x86_64')
license=('MIT')
url="https://github.com/Discngine/fpocket"
depends=('netcdf' 'vmd-molfile-plugins')
makedepends=('git' 'patch' 'gcc')
source=("$pkgname::git+https://github.com/Discngine/fpocket.git"
        "fpocket.patch")
sha1sums=('SKIP'
          '9e2ec2ad73e0951446d3521335fc90cda12ebf8b')

pkgver() {
  cd "${pkgname}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  cd ${pkgname}
  patch -Np0 -i "${srcdir}/fpocket.patch"
}

build() {
  cd ${pkgname}
  
  make
}

package() {
  cd ${pkgname}

  install -Dm755 bin/fpocket ${pkgdir}/usr/bin/fpocket
  install -Dm755 bin/dpocket ${pkgdir}/usr/bin/dpocket
  install -Dm755 bin/tpocket ${pkgdir}/usr/bin/tpocket
  install -Dm755 bin/mdpocket ${pkgdir}/usr/bin/mdpocket
  install -Dm644 man/fpocket.8 ${pkgdir}/usr/share/man/man8/fpocket.8
  install -Dm644 man/dpocket.8 ${pkgdir}/usr/share/man/man8/dpocket.8
  install -Dm644 man/tpocket.8 ${pkgdir}/usr/share/man/man8/tpocket.8
}
