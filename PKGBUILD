# Maintainer: robertfoster
pkgname=agentgateway-bin # renovate: datasource=github-releases depName=agentgateway/agentgateway
pkgver=0.10.2
pkgrel=1
pkgdesc="Next Generation Agentic Proxy for AI Agents and MCP servers"
arch=('x86_64' 'aarch64')
url="https://github.com/agentgateway/agentgateway"
license=('Apache-2.0')
provides=("${pkgname%%-bin}")
conflicts=("${pkgname%%-bin}")
replaces=("${pkgname%%-bin}")

source=(
  "${pkgname%%-bin}.service"
  "${pkgname%%-bin}.sysusers"
  "${pkgname%%-bin}.tmpfiles"
)
source_x86_64=("${url}/releases/download/v${pkgver}/agentgateway-linux-amd64")
source_aarch64=("${url}/releases/download/v${pkgver}/agentgateway-linux-arm64")

sha256sums=(
  '391dad8863490fce1a82a71736fde9cf998c8a6e926516c8487b41cf3819d47e'
  '27f129b0434a4bb00a276f9c391dab3280cf9c657fefd1b358aded52c7937afb'
  '7f8a58eb515951cb9499e1201280b34d65d8137f3f98e0d2f1de838a80713961'
)
sha256sums_x86_64=('f7ed99f71a977bcca39f13e6fee5de8431d691b295aa660af866cdd487954357')
sha256sums_aarch64=('6a4cb96f95a5a9b5a30d74ce19e79e06ad870e043dca804fa07e3794a0c5e623')

package() {
  if [ "${CARCH}" = "x86_64" ]; then
    install -Dm755 "${srcdir}/${pkgname%%-bin}-linux-amd64" \
      "${pkgdir}/usr/bin/${pkgname%%-bin}"
  elif [ "${CARCH}" = "aarch64" ]; then
    install -Dm755 "${srcdir}/${pkgname%%-bin}-linux-arm64" \
      "${pkgdir}/usr/bin/${pkgname%%-bin}"
  fi

  # Install systemd service file
  install -Dm644 "${srcdir}/${pkgname%%-bin}.service" \
    "${pkgdir}/usr/lib/systemd/system/${pkgname%%-bin}.service"

  # Install systemd sysusers file
  install -Dm644 "${srcdir}/${pkgname%%-bin}.sysusers" \
    "${pkgdir}/usr/lib/sysusers.d/${pkgname%%-bin}.conf"

  # Install systemd tmpfiles file
  install -Dm644 "${srcdir}/${pkgname%%-bin}.tmpfiles" \
    "${pkgdir}/usr/lib/tmpfiles.d/${pkgname%%-bin}.conf"
}
