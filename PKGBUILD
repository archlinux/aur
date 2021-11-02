# Maintainer: robertfoster
# Contributor: LIN Rs <LinRs[d]users.noreply.github.com>
# Contributor: yochananmarqos <mark.wagie at tutanota dot com>
pkgbase=devilutionx
pkgname=("${pkgbase}" "${pkgbase}-fonts" "${pkgbase}-voices")
_pkgname=devilutionX
pkgver=1.3.0
pkgrel=3
pkgdesc="Diablo devolved for linux"
arch=('armv6h' 'armv7h' 'arm' 'aarch64' 'i686' 'x86_64')
url="https://github.com/diasurgical/devilutionX"
license=('custom:unlicense')
depends=('fmt' 'libpng' 'libsodium' 'sdl2')
makedepends=('cmake' 'gettext' 'git' 'smpq')
options=('strip')
source=("${url}/archive/${pkgver}.tar.gz"
  "${url}-assets/releases/download/v1/fonts.mpq"
  "${url}-assets/releases/download/v1/pl.mpq")

build() {
  cd "${srcdir}/${_pkgname}-${pkgver}/build"
  cmake .. \
    -DCMAKE_INSTALL_PREFIX="/usr" \
    -DVERSION_NUM="${pkgver}"

  cmake --build .
}

package_devilutionx() {
  pkgdesc="Diablo devolved for linux (main package)"
  install="${pkgbase}".install
  optdepends=("${pkgbase}-fonts" "${pkgbase}-voices")

  cd "${srcdir}/${_pkgname}-${pkgver}/build"
  DESTDIR=${pkgdir} \
    cmake --install .
}

package_devilutionx-voices() {
  pkgdesc="Additional voices for DevilutionX"
  depends=("${pkgbase}")

  install -Dm644 pl.mpq \
    ${pkgdir}/usr/share/diasurgical/devilutionx/pl.mpq
}

package_devilutionx-fonts() {
  pkgdesc="Additional fonts for DevilutionX"
  depends=("${pkgbase}")

  install -Dm644 fonts.mpq \
    ${pkgdir}/usr/share/diasurgical/devilutionx/fonts.mpq
}

sha256sums=('6911ec6432430ff30212b6817f311987793c0661f39dc395103d01555fdc8c77'
  'eddd389578e080c10b433d1c9367cf4bf99727227e9d3bd09a18203dc9cdae20'
  '9ca72ceea406b9b58de549a782d794502e8aea566e5c2d5bc3f8f051772fe797')
