# Maintainer: Hashim-K <Hashim-K@users.noreply.github.com>

pkgname=usagestat-alpha-bin
_upstream_version=2.0.0-alpha.3
pkgver=2.0.0alpha.3
pkgrel=1
pkgdesc="Scriptable CLI for local agent usage data"
arch=("x86_64")
url="https://github.com/Hashim-K/usagestat"
license=("MIT")
depends=("glibc>=2.39")
provides=("usagestat")
conflicts=("usagestat")
source_x86_64=("usagestat-${_upstream_version}-linux-x86_64.tar.gz::${url}/releases/download/v${_upstream_version}/usagestat-linux-x86_64.tar.gz")
sha256sums_x86_64=("e53e36b9001caf5b0cdd4de3acb077dcddaa41a7f2acd91f5d81682ab3b98672")

package() {
  install -Dm755 "${srcdir}/usagestat" "${pkgdir}/usr/bin/usagestat"
  if [[ -f "${srcdir}/usagestatd" ]]; then
    install -Dm755 "${srcdir}/usagestatd" "${pkgdir}/usr/bin/usagestatd"
  fi
  install -Dm644 "${srcdir}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  mkdir -p "${pkgdir}/usr/share/usagestat"
  cp -a "${srcdir}/plugins" "${pkgdir}/usr/share/usagestat/"
}
