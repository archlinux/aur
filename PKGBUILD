# Maintainer: robertfoster
# Contributor: LIN Rs <LinRs[d]users.noreply.github.com>
# Contributor: yochananmarqos <mark.wagie at tutanota dot com>

pkgbase=devilutionx
pkgname=("${pkgbase}" "${pkgbase}-fonts" "${pkgbase}-voices")
_pkgname=devilutionX
pkgver=1.4.1
pkgrel=2
pkgdesc="Diablo devolved for linux"
arch=('armv6h' 'armv7h' 'arm' 'aarch64' 'i686' 'x86_64')
url="https://github.com/diasurgical/devilutionX"
license=('custom:unlicense')
depends=('bzip2' 'fmt' 'libpng' 'libsodium' 'sdl2' 'sdl2_image' 'simpleini' 'zlib')
makedepends=('cmake' 'gettext' 'git' 'smpq')
options=('strip')
source=("${url}/archive/${pkgver}.tar.gz"
  "${url}-assets/releases/download/v2/fonts.mpq"
  "${url}-assets/releases/download/v2/pl.mpq"
  "${url}-assets/releases/download/v2/ru.mpq"
)

prepare() {
  if [ ! -d build ]; then
    mkdir build
  fi
}

build() {
  cd build
  cmake ../"${_pkgname}-${pkgver}" \
    -DBUILD_TESTING=off \
    -DCMAKE_INSTALL_PREFIX="/usr" \
    -DVERSION_NUM="${pkgver}"

  cmake --build .
}

package_devilutionx() {
  pkgdesc="Diablo devolved for linux (main package)"
  install="${pkgbase}".install
  optdepends=("${pkgbase}-fonts" "${pkgbase}-voices")

  cd build
  DESTDIR="${pkgdir}" \
    cmake --install .
}

package_devilutionx-voices() {
  pkgdesc="Additional voices for DevilutionX"
  depends=("${pkgbase}")

  install -Dm644 pl.mpq \
    "${pkgdir}/usr/share/diasurgical/devilutionx/pl.mpq"
  install -Dm644 ru.mpq \
    "${pkgdir}/usr/share/diasurgical/devilutionx/ru.mpq"
}

package_devilutionx-fonts() {
  pkgdesc="Additional fonts for DevilutionX"
  depends=("${pkgbase}")

  install -Dm644 fonts.mpq \
    "${pkgdir}/usr/share/diasurgical/devilutionx/fonts.mpq"
}

sha256sums=('54b9fd496eba5b82d7e64891ab4de808f539c60b3b94bfa49639e0d9580fb7b8'
            '0988354014c0b969d06001eb1f7e6395de9b41a8de06315745e75d98b5334201'
            'd2b4b794312e5c79b49eda19f97820e213d8feff3f479834cd290faf22eb6469'
            '2b65103615d68a146fa8685f82f40c82417050baee351dc5b92813240537aac9')
