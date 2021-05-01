# Maintainer: Jakob Kartschall <jakob at kartschall dot de>
pkgname=grafana-agent-bin
pkgver=0.13.1
pkgrel=1
pkgdesc="Grafana Agent is a telemetry collector for sending metrics, logs, and trace data to the opinionated Grafana observability stack."
arch=('x86_64' 'aarch64' 'armv6h' 'armv7h')
url="https://github.com/grafana/agent"
license=('Apache')

provides=('grafana-agent')
conflicts=('grafana-agent')
install='grafana-agent.install'

case "${CARCH}" in
  x86_64)  _JARCH='amd64';;
  aarch64) _JARCH='arm64';;
  armv6h)  _JARCH='armv6';;
  armv7h)  _JARCH='armv7';;
esac

_srcpkgname=agent

source=('grafana-agent.service' 'grafana-agent.yaml')
source_x86_64=("https://github.com/grafana/agent/releases/download/v${pkgver}/${_srcpkgname}-linux-${_JARCH}.zip")
source_aarch64=("https://github.com/grafana/agent/releases/download/v${pkgver}/${_srcpkgname}-linux-${_JARCH}.zip")
source_armv6h=("https://github.com/grafana/agent/releases/download/v${pkgver}/${_srcpkgname}-linux-${_JARCH}.zip")
source_armv7h=("https://github.com/grafana/agent/releases/download/v${pkgver}/${_srcpkgname}-linux-${_JARCH}.zip")

sha256sums=('SKIP' 'SKIP')
sha256sums_x86_64=('486872ac68c551f9db9cbe61b004e5098d8d2745b46ea8afe03d7c5b891af9fb')
sha256sums_aarch64=('0ed830b853d0238f23bf9b676dc5331e004932806e9f4b324f74e39f8ca4aad5')
sha256sums_armv6h=('798b927ee35606ce969a514fe8019c9c5f0b56f86d1399dd16b97eb4530c6bd5')
sha256sums_armv7h=('5ccce1d19fa1ca76bd51489d55c1d22de016d17c16108707a7b7036e08374c33')

package() {
  _output="${srcdir}/${_srcpkgname}-linux-${_JARCH}"
  install -D -m0755 "${_output}" "${pkgdir}/usr/bin/${pkgname/-bin/}"

  # Install Config File
  install -D -m0755 "grafana-agent.yaml" "${pkgdir}/etc/grafana-agent/grafana-agent.yaml"

  # Install SystemD Service File
  install -D -m0644 "grafana-agent.service" "${pkgdir}/usr/lib/systemd/system/grafana-agent.service"
}
