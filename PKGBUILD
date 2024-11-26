# Maintainer: envolution
pkgname=llama.cpp-service
pkgver=1.1
pkgrel=1
pkgdesc="Systemd service files and /etc/ configuration for Llama.cpp Server"
arch=('any')
license=('MIT')
backup=("etc/$pkgname/llama-server.conf")
install=$pkgname.install
depends=('systemd')
optdepends=(
  'llama.cpp-server-tray: Companion system tray app for llama.cpp-server-service'
)
source=(
  "llama.cpp.service"
  "llama.cpp.socket"
  "llama-server.conf.sample"
  "llama-server.env"
)
sha256sums=('b22a3e8a855eb17a1b62fb351e35d8139b249358dfc11668d5d06cca8ce2b547'
            '56ccc5e5894cca0f6142eacd509782187ade6aa22d16cdd3dfa124ec19232fb3'
            '8610d11eb5ef719d5a814acb0ed5cda6d05ca8a2f2fb8c4f0065ec35f123346d'
            '1b1a18bdf343b97ed70ebc2b64af20517dc88d1d3540886f3817779c1dda344f')

package() {
  # Install systemd service and socket files
  install -Dm644 "${srcdir}/llama.cpp.service" "${pkgdir}/usr/lib/systemd/system/llama.cpp.service"
  install -Dm644 "${srcdir}/llama.cpp.socket" "${pkgdir}/usr/lib/systemd/system/llama.cpp.socket"

  # Install configuration sample end env wrapper
  install -Dm644 "${srcdir}/llama-server.conf.sample" "${pkgdir}/etc/${pkgname}/llama-server.conf"
  install -Dm644 "${srcdir}/llama-server.env" "${pkgdir}/etc/${pkgname}/llama-server.env"
}
# vim:set ts=2 sw=2 et:
