# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=traefik-forward-auth-bin
pkgver=4.16.0
pkgrel=1
pkgdesc="Forward authentication service with Google and OpenID login for Traefik"
arch=('x86_64' 'aarch64')
url="https://github.com/ItalyPaleAle/traefik-forward-auth"
license=('MIT')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::${_dl}/traefik-forward-auth-${pkgver}-linux-amd64.tar.gz")
source_aarch64=("${pkgname}-${pkgver}-aarch64.tar.gz::${_dl}/traefik-forward-auth-${pkgver}-linux-arm64.tar.gz")
sha256sums_x86_64=('d3aa54451ffe38391ee24583c06660a7c3ecd3e79ed3a7ad48c847e50cd5a348')
sha256sums_aarch64=('03e4677323f93b74862abcfb35c0bfd9787a59a4fa5cc67960d0dff260c5d659')

package() {
  local _dir
  case $CARCH in
    x86_64) _dir="traefik-forward-auth-${pkgver}-linux-amd64" ;;
    aarch64) _dir="traefik-forward-auth-${pkgver}-linux-arm64" ;;
  esac
  install -Dm755 "${_dir}/traefik-forward-auth" "${pkgdir}/usr/bin/traefik-forward-auth"
  install -Dm644 "${_dir}/LICENSE.md" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
