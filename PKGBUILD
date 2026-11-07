# Maintainer: Frikilinux <frikilinux@gmail.com>

pkgname=aries-connect-bin
_pkgname="${pkgname%-bin}"
pkgver=0.4.0
pkgrel=1
pkgdesc="KDE Connect-compatible daemon exposing devices over D-Bus (no KDE/Qt dependencies)"
arch=('x86_64')
# url="https://github.com/Frikilinux/aries-connect"
url="https://gitlab.com/zotta/aries-connect/"
license=(GPL-2.0-or-later)
depends=(
  glibc
  libgcc
)
makedepends=()
conflicts=(${_pkgname})
options=(!lto)
# source=("${url}/releases/download/v${pkgver}/${_pkgname}-${pkgver}-x86_64-unknown-linux-gnu.tar.gz")
source=("${url}/-/releases/v${pkgver}/downloads/${_pkgname}-${pkgver}-x86_64-unknown-linux-gnu.tar.gz")
sha256sums=('af29f8f7735860947daee06da6601d54e06d7e39cfe8c123d17ad779639ba524')

package() {
  cd "${_pkgname}-${pkgver}-x86_64-unknown-linux-gnu"

  install -Dm755 aries-connect "${pkgdir}/usr/bin/aries-connect"
  install -Dm644 contrib/aries-connect.service \
    "${pkgdir}/usr/lib/systemd/user/aries-connect.service"
  for f in doc/*; do
    install -Dm 644 "$f" "${pkgdir}/usr/share/doc/${_pkgname}/$(basename "$f")"
  done
}
