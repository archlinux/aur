# Maintainer: Nasir <https://github.com/NasirA1991>
pkgname=honrp-bin
pkgver=0.2.3
pkgrel=1
pkgdesc='Discord Rich Presence for Heroes of Newerth (Juvio) on Linux/Steam Proton'
arch=('x86_64')
url='https://github.com/NasirA1991/honrp'
license=('MIT')
provides=('honrp')
conflicts=('honrp')
options=('!strip')
source=(
  "honrp-linux-x86_64::${url}/releases/download/v${pkgver}/honrp-linux-x86_64"
  "LICENSE::${url}/raw/v${pkgver}/LICENSE"
  "config.example.json::${url}/raw/v${pkgver}/config.example.json"
)
sha256sums=(
  'f892ce45017f85f2791acfa29ce0afeb12455de626078f82bce78bc462f8cd58'
  '8fcdd0dd9c0c06c3e94507870588dd73e04b460562ff01b9680e155d84c395a8'
  '5c5cdf799e1cdd1609fa74a336431860b4ab7df344e1f8026c0678c8b415ee4e'
)

package() {
  install -Dm755 "${srcdir}/honrp-linux-x86_64" "${pkgdir}/usr/bin/honrp"
  install -Dm644 "${srcdir}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm644 "${srcdir}/config.example.json" "${pkgdir}/usr/share/honrp/config.example.json"
}

post_install() {
  cat <<'MSG'
Finish setup as your user (not root):
  honrp install

This installs the Lua bridge into your Heroes of Newerth Proton prefix and
enables the systemd user service. A Discord application id is built in;
override it with: honrp install --client-id <ID>
Restart Heroes of Newerth afterwards.
MSG
}

post_upgrade() {
  post_install
}
