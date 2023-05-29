# Maintainer: myon <myon@myon98.net>
pkgnamebase=xkeropi
pkgname=${pkgnamebase}-git
pkgver=r271.d7f7053
pkgrel=1
pkgdesc='X68000 emulator'
arch=(x86_64)
url=https://gitlab.com/nekodevteam/xkeropi
license=(BSD)
depends=(gtk2 sdl12-compat)
makedepends=(git imake)
provides=(${pkgnamebase})
conflicts=(${pkgnamebase})
source=(git+https://gitlab.com/nekodevteam/xkeropi.git)
sha256sums=(SKIP)

pkgver() {
  cd "${pkgnamebase}"
  printf 'r%s.%s' "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "${pkgnamebase}"
  xmkmf -a
  make ${MAKEFLAGS} LOCAL_LDFLAGS="${LDFLAGS}"
}

package() {
  cd "${srcdir}/${pkgnamebase}"
  make DESTDIR="${pkgdir}/" install
  install -Dm644 COPYING "${pkgdir}/usr/share/licenses/${pkgname}/COPYING"
}

