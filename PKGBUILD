# Maintainer: robertfoster
pkgname=rmpd-bin
pkgver=0.14.0 # renovate: datasource=github-releases depName=M0Rf30/rmpd
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
sha256sums_x86_64=('9e2a80184c2fcefb6a94be4c444e2d66fa87de6565c18efaa3a95f4ece8805f1')
sha256sums_aarch64=('747eded8dc57841da98ec9fcddafeb3d73552caad6d4f849c57809a7bba8ae8f')

package() {
  # Install binary
  install -Dm755 "${srcdir}/${pkgname%%-bin}" "${pkgdir}/usr/bin/${pkgname%%-bin}"

  # Install systemd service file
  install -Dm644 "${srcdir}/${pkgname%%-bin}.service" \
    "${pkgdir}/usr/lib/systemd/user/${pkgname%%-bin}.service"
}
