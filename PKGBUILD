# Maintainer: fireflower <fireflower.hs@gmail.com>

pkgname=hbacklight-git
pkgver=r19.aac9995
pkgrel=0
pkgdesc="acpi backlight & led manager"
arch=('x86_64')
url="https://github.com/paroxayte/hbacklight"
license=('MIT')
makedepends=('git' 'cabal-install')
source=("${pkgname}::git://github.com/paroxayte/hbacklight.git")
noextract=()
md5sums=('SKIP')

# supported ghc versions are 8.6.5, 8.8.1. Editing ghcver will allow building
# with alternate versions

ghcver="8.6.5"

pkgver() {
  cd "${srcdir}/${pkgname}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "${srcdir}/${pkgname}"
  cabal build --with-compiler="ghc-${ghcver}"
}

package() {
  cd "${srcdir}/${pkgname}"
  mkdir -p "${pkgdir}/usr/bin"
  cabal install --install-method=copy --installdir="${pkgdir}/usr/bin"
}
