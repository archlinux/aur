# Maintainer: brokenpip3 <brokenpip3[at]gmail[dot]com>
# Maintainer: Thomas Labarussias <issif+aur@gadz.org>
# https://github.com/brokenpip3/my-pkgbuilds
# Contributor: Kris Nóva R.I.P. <kris@nivenly.com>

pkgbase=falco-module-dkms
pkgname=falco-module-dkms
provides=(falco-module-dkms)
pkgver=0.40.0
pkgrel=1
pkgdesc="Cloud native runtime security - dkms module"
arch=(x86_64)
license=(Apache)
depends=(falco-bin dkms linux-headers)
url="https://github.com/falcosecurity/falco"
source_x86_64=(
    "https://download.falco.org/packages/bin/${arch}/falco-${pkgver}-x86_64.tar.gz"
    "falco-dkms.service"
)
sha256sums_x86_64=('e9f14b04f9675ce6a168f62efeee4e7365cdc07747c9f8deeda240f76e8b1f55'
                   '86f0681cb0738adecc13359b52d1471ac4dc8ffb36a71a4c2054a4b392835d78')
install="falco-dkms.install"

_driver="8.0.0+driver"

package() {
    install -d "${pkgdir}/usr/src/falco-${pkgver}"
    for _src in "${srcdir}/falco-${pkgver}-${arch}/usr/src/falco-${_driver}/"*; do
       [[ -f "$_src" ]] && install -Dm644 "$_src" "${pkgdir}/usr/src/falco-${pkgver}/$(basename "$_src")"
    done
    install -Dm644 "${srcdir}/falco-dkms.service" "${pkgdir}/usr/lib/systemd/system/falco-dkms.service"
}
