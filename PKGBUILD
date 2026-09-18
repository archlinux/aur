# Maintainer: robertfoster
pkgname=rmpd-bin
pkgver=0.8.1 # renovate: datasource=github-releases depName=M0Rf30/rmpd
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
sha256sums=('6cb19b9086c95f4d1db803c65cae1bd8a422c2114deeb527787e0783a29101db')
sha256sums_x86_64=('78841ebe4ee78fc8bed514aff09ac212c07126801ec247a777f8b7a0ee6251f5')
sha256sums_aarch64=('b570837d3589211418924f49e60b85d1d331b136f2cd7c8571a548d9a10036d7')

package() {
  # Install binary
  install -Dm755 "${srcdir}/${pkgname%%-bin}" "${pkgdir}/usr/bin/${pkgname%%-bin}"

  # Install systemd service file
  install -Dm644 "${srcdir}/${pkgname%%-bin}.service" \
    "${pkgdir}/usr/lib/systemd/user/${pkgname%%-bin}.service"
}
