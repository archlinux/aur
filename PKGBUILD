# Maintainer: Hashim-K <Hashim-K@users.noreply.github.com>

pkgname=usagestat-alpha-bin
_upstream_version=2.0.0-alpha.1
pkgver=2.0.0alpha.1
pkgrel=1
pkgdesc="Scriptable CLI for local agent usage data"
arch=("x86_64")
url="https://github.com/Hashim-K/usagestat"
license=("MIT")
depends=("glibc>=2.39")
provides=("usagestat")
conflicts=("usagestat")
source_x86_64=("usagestat-${_upstream_version}-linux-x86_64.tar.gz::${url}/releases/download/v${_upstream_version}/usagestat-linux-x86_64.tar.gz")
sha256sums_x86_64=("f18b97f82d6448b79cb64f93ebfe1851daf0733bdfe3bc7f82563a899f7e5284")

package() {
  install -Dm755 "${srcdir}/usagestat" "${pkgdir}/usr/bin/usagestat"
  if [[ -f "${srcdir}/usagestatd" ]]; then
    install -Dm755 "${srcdir}/usagestatd" "${pkgdir}/usr/bin/usagestatd"
  fi
  install -Dm644 "${srcdir}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  mkdir -p "${pkgdir}/usr/share/usagestat"
  cp -a "${srcdir}/plugins" "${pkgdir}/usr/share/usagestat/"
}
