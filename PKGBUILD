# Maintainer: robertfoster
pkgname=rmpd-bin
pkgver=0.13.1 # renovate: datasource=github-releases depName=M0Rf30/rmpd
pkgrel=1
pkgdesc="A flexible, powerful, server-side application for playing music"
arch=('x86_64' 'aarch64')
url="https://github.com/M0Rf30/rmpd"
license=('MIT' 'Apache-2.0')
depends=('gcc-libs' 'alsa-lib' 'sqlite')
optdepends=(
  'pulseaudio: PulseAudio output support'
  'pipewire: PipeWire output support'
  'snapcast: Multi-room audio synchronization'
)
provides=("${pkgname%%-bin}")
conflicts=("${pkgname%%-bin}" "${pkgname%%-bin}-git")
source=("${pkgname%%-bin}.service::${url}/raw/${pkgver}/contrib/systemd/rmpd.service")
source_x86_64=("${pkgname%%-bin}-${pkgver}-x86_64.tar.gz::${url}/releases/download/${pkgver}/${pkgname%%-bin}-${pkgver}-x86_64-unknown-linux-gnu.tar.gz")
source_aarch64=("${pkgname%%-bin}-${pkgver}-aarch64.tar.gz::${url}/releases/download/${pkgver}/${pkgname%%-bin}-${pkgver}-aarch64-unknown-linux-gnu.tar.gz")
sha256sums=('9335066109d9ba6da761b7f2b2d8c627c50c60b06eafb822fcc692f58b7fb677')
sha256sums_x86_64=('780a547f03dc443657e784d465a508cef89c2266e02e24c80883b2ace1b5f6ae')
sha256sums_aarch64=('dfc6173095b06cff836cabf06bd37ed5d79333fc8a2c91e8301dad141aab149d')

package() {
  # Install binary
  install -Dm755 "${srcdir}/${pkgname%%-bin}" "${pkgdir}/usr/bin/${pkgname%%-bin}"

  # Install systemd service file
  install -Dm644 "${srcdir}/${pkgname%%-bin}.service" \
    "${pkgdir}/usr/lib/systemd/user/${pkgname%%-bin}.service"
}
