# Maintainer: Jozef Riha <jose1711 at gmail dot com>

pkgname=simpmd-git
pkgdesc="Full emulator of PMD85 (git)"
pkgver=r63.cee3b6c
pkgrel=1
arch=('i686' 'x86_64')
url="https://github.com/jose1711/simpmd"
license=('Apache-2.0')
depends=('sdl2' 'sdl2_ttf' 'gcc-libs')
makedepends=('git')
replaces=('simpmd-svn')
source=("${pkgname}"::'git+https://github.com/jose1711/simpmd.git' 'simpmd.desktop')
md5sums=('SKIP'
         'SKIP')

build() {
  cd "${srcdir}/${pkgname}"
  make PMD_BUILD=RELEASE PMD_SHARE=/usr/share/simpmd/ PMD_STATEHOME=.local/share/simpmd
}

pkgver() {
  cd "$srcdir/${pkgname}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  cd "${srcdir}/${pkgname}"
  install -Dm755 bin/simpmd "${pkgdir}/usr/bin/simpmd"
  make install-data PMD_SHARE="${pkgdir}/usr/share/simpmd/"
  install -Dm644 README.md CHANGELOG.md -t "${pkgdir}/usr/share/doc/${pkgname}"
  install -Dm644 doc/*.md -t "${pkgdir}/usr/share/doc/${pkgname}"
  install -Dm644 COPYING "${pkgdir}/usr/share/licenses/${pkgname}/COPYING"
  install -Dm644 "${srcdir}/simpmd.desktop" "${pkgdir}/usr/share/applications/simpmd.desktop"
}
