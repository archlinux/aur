# Maintainer: fireflower <fireflower.hs@gmail.com>

pkgname=hbacklight-git
pkgver=r24.0dfc5e8
pkgrel=1
pkgdesc="acpi backlight & led manager"
arch=('x86_64')
url="https://github.com/paroxayte/hbacklight"
license=('MIT')
makedepends=('git' 'cabal-install' 'ghc')
source=("${pkgname}::git://github.com/paroxayte/hbacklight.git")
noextract=()
md5sums=('SKIP')

pkgver() {
  cd "${srcdir}/${pkgname}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  cd "${srcdir}/${pkgname}"
  git checkout release
}

build() {
  cd "${srcdir}/${pkgname}"
  cabal build
}

package() {
  cd "${srcdir}/${pkgname}"
  mkdir -p "${pkgdir}/usr/bin"
  cabal install --install-method=copy --installdir="${pkgdir}/usr/bin"
}
