# Maintainer: Yuval Adam <yuval at y3xz dot com> PGP-Key: 271386AA2EB7672F

pkgname=bond-git
pkgver=7a14f45
pkgrel=1
pkgdesc="A cross-platform framework for working with schematized data"
arch=('any')
url="https://github.com/microsoft/bond/"
license=(MIT)
depends=('')
makedepends=('cmake' 'boost' 'ghc' 'cabal-install' 'rapidjson-git')
provides=('bond')
source=("$pkgname::git+$url") 
sha1sums=('SKIP')

pkgver() {
  cd "$pkgname"
  echo $(git describe --always | sed 's/-/./g')
}

build() {
  cd "$pkgname"
  
  # update cabal before we start
  cabal update

  mkdir build
  cd build
  cmake -DCMAKE_INSTALL_PREFIX=/usr ..
  make
}

package() {
  cd "$pkgname"
  cd build
  make DESTDIR=${pkgdir} install
}

# vim:set ts=2 sw=2 et:
