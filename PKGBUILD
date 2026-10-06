# Maintainer: robertfoster
pkgname=rmpd-bin
pkgver=0.12.0 # renovate: datasource=github-releases depName=M0Rf30/rmpd
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
sha256sums_x86_64=('d20757d87abada9c9a4883edfeb3324ade13a4dd94f12f0651f2359ba16b9285')
sha256sums_aarch64=('01ff5cdb2c353fe3efa76e7b7378f87f17e0e2b8a7edbe192a6472953e421e7a')

package() {
  # Install binary
  install -Dm755 "${srcdir}/${pkgname%%-bin}" "${pkgdir}/usr/bin/${pkgname%%-bin}"

  # Install systemd service file
  install -Dm644 "${srcdir}/${pkgname%%-bin}.service" \
    "${pkgdir}/usr/lib/systemd/user/${pkgname%%-bin}.service"
}
