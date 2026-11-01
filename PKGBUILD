# Maintainer: Frikilinux <frikilinux@gmail.com>

pkgname=aries-connect-bin
_pkgname="${pkgname%-bin}"
pkgver=0.2.0
pkgrel=1
pkgdesc="KDE Connect-compatible daemon exposing devices over D-Bus (no KDE/Qt dependencies)"
arch=('x86_64')
url="https://github.com/Frikilinux/aries-connect"
license=(GPL-2.0-or-later)
depends=(
  glibc
  libgcc
)
makedepends=()
conflicts=(${_pkgname})
options=(!lto)
source=(
  "${_pkgname}-${pkgver}.tar.gz::${url}/releases/download/v${pkgver}/${_pkgname}-${pkgver}-x86_64-unknown-linux-gnu.tar.gz"
  "https://raw.githubusercontent.com/Frikilinux/${_pkgname}/v${pkgver}/contrib/aries-connect.service"
)
sha256sums=(
  'e499279a0d964950b9eb5dff26caa23ff73133a11f836f8644a054af53765343'
  '8358a38a739ed8c21f27944ced458fde0856822ce8156993755f754c134462a5'
)

package() {
  cd "${_pkgname}-${pkgver}-x86_64-unknown-linux-gnu"

  install -Dm755 aries-connect "${pkgdir}/usr/bin/aries-connect"
  install -Dm644 ${srcdir}/aries-connect.service \
    "${pkgdir}/usr/lib/systemd/user/aries-connect.service"
  install -dm 755 "${pkgdir}/usr/share/doc/${_pkgname}"
  install -m 644 doc/* "${pkgdir}/usr/share/doc/${_pkgname}"
}
