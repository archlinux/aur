# Maintainer: Frikilinux <frikilinux@gmail.com>

pkgname=aries-connect-bin
_pkgname="${pkgname%-bin}"
pkgver=0.3.0
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
source=("${url}/releases/download/v${pkgver}/${_pkgname}-${pkgver}-x86_64-unknown-linux-gnu.tar.gz")
sha256sums=('b97f8cb54db7de845548af175688594bfa992bc15cdb906cd2dbfa6a1614c90d')

package() {
  cd "${_pkgname}-${pkgver}-x86_64-unknown-linux-gnu"

  install -Dm755 aries-connect "${pkgdir}/usr/bin/aries-connect"
  install -Dm644 contrib/aries-connect.service \
    "${pkgdir}/usr/lib/systemd/user/aries-connect.service"
  for f in doc/*; do
    install -Dm 644 "$f" "${pkgdir}/usr/share/doc/${_pkgname}/$(basename "$f")"
  done
}
