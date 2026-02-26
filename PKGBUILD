# Maintainer: robertfoster
pkgname=rmpd-bin
pkgver=0.2.0 # renovate: datasource=github-releases depName=M0Rf30/rmpd
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
source=("${pkgname%%-bin}.service")
source_x86_64=("${pkgname%%-bin}-${pkgver}-x86_64.tar.gz::${url}/releases/download/${pkgver}/${pkgname%%-bin}-${pkgver}-x86_64-unknown-linux-gnu.tar.gz")
source_aarch64=("${pkgname%%-bin}-${pkgver}-aarch64.tar.gz::${url}/releases/download/${pkgver}/${pkgname%%-bin}-${pkgver}-aarch64-unknown-linux-gnu.tar.gz")
sha256sums=('f8068b7c7aa732a8b0649d795c50ff74d5da10069f103206366b051368c9c8fe')
sha256sums_x86_64=('83b609ce6b9533da2c72d77d775b6dff417c08da4bed9685032a05927f2167ef')
sha256sums_aarch64=('435da1a61c138d5d6b01ca625502b11ffc6584449551e722250ef8cf146b1202')

package() {
  # Install binary
  install -Dm755 "${srcdir}/${pkgname%%-bin}" "${pkgdir}/usr/bin/${pkgname%%-bin}"

  # Install systemd service file
  install -Dm644 "${srcdir}/${pkgname%%-bin}.service" \
    "${pkgdir}/usr/lib/systemd/user/${pkgname%%-bin}.service"
}
