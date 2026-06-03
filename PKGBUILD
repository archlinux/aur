# Maintainer: robertfoster
pkgname=mediaflow-proxy-light-bin
pkgver=1.1.2 # renovate: datasource=github-releases depName=mhdzumair/mediaflow-proxy-light
pkgrel=1
pkgdesc="High-performance Rust streaming proxy: HLS/DASH/Xtream/Acestream/Telegram, drop-in MediaFlow Proxy reimplementation"
arch=('x86_64' 'aarch64')
url="https://github.com/mhdzumair/mediaflow-proxy-light"
license=('MIT')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
replaces=("${pkgname%-bin}")
backup=(
  "etc/${pkgname%-bin}/${pkgname%-bin}.env"
)

source=(
  "${pkgname%-bin}.service"
  "${pkgname%-bin}.sysusers"
  "${pkgname%-bin}.tmpfiles"
  "${pkgname%-bin}.env"
)
source_x86_64=("${pkgname%-bin}-${pkgver}-x86_64::${url}/releases/download/${pkgver}/mediaflow-proxy-light-linux-x86_64")
source_aarch64=("${pkgname%-bin}-${pkgver}-aarch64::${url}/releases/download/${pkgver}/mediaflow-proxy-light-linux-aarch64")

sha256sums=('5b630d98a792a00632fe526bb4ba8bb9bd957e4a2a55da3d3eed6c04ed13ac60'
            '959aa6e2fd1886352083f64cb0561e3a052380a94ca98e96d01a8a3f77fa4419'
            'c7d7a5fdbe91b5097e33f98863acf6a25b036b0a173ccab01944e077c9040430'
            'cfc5dfa5ef03b75d79be464d5f0be84c2803b8ba57fd36909c68849938d9061c')
sha256sums_x86_64=('6bafb9723cff73317aa1cb95bbf064c3cd9d35d03b1175ca6e9cd0ea3bfa0888')
sha256sums_aarch64=('6b9ca19c52bead84ea725268fdd8cce144892eb17d3246638e782963ffbcad34')

package() {
  # Install binary
  install -Dm755 "${srcdir}/${pkgname%-bin}-${pkgver}-${CARCH}" \
    "${pkgdir}/usr/bin/${pkgname%-bin}"

  # Install systemd service file
  install -Dm644 "${srcdir}/${pkgname%-bin}.service" \
    "${pkgdir}/usr/lib/systemd/system/${pkgname%-bin}.service"

  # Install systemd sysusers file
  install -Dm644 "${srcdir}/${pkgname%-bin}.sysusers" \
    "${pkgdir}/usr/lib/sysusers.d/${pkgname%-bin}.conf"

  # Install systemd tmpfiles file
  install -Dm644 "${srcdir}/${pkgname%-bin}.tmpfiles" \
    "${pkgdir}/usr/lib/tmpfiles.d/${pkgname%-bin}.conf"

  # Install default environment file
  install -Dm640 "${srcdir}/${pkgname%-bin}.env" \
    "${pkgdir}/etc/${pkgname%-bin}/${pkgname%-bin}.env"
}
