# Maintainer: brokenpip3 <brokenpip3[at]gmail[dot]com>
# Maintainer: Thomas Labarussias <issif+aur@gadz.org>
# https://github.com/brokenpip3/my-pkgbuilds
# Contributor: Kris Nóva R.I.P. <kris@nivenly.com>

pkgbase=falco-module-dmks
pkgname=falco-module-dmks
provides=(falco-module-dmks)
pkgver=0.37.1
pkgrel=2
pkgdesc="Cloud native runtime security - dkms module"
arch=(x86_64)
license=(Apache)
depends=(falco dkms linux-headers)
url="https://github.com/falcosecurity/falco"
source_x86_64=(
    "https://download.falco.org/packages/bin/${arch}/falco-${pkgver}-x86_64.tar.gz"
    "falco-dkms.service"
)
sha256sums_x86_64=('8d441495f72489be1bcab1ce8476ae26007fe2063c8053e8082b264066c46f25'
                   '86f0681cb0738adecc13359b52d1471ac4dc8ffb36a71a4c2054a4b392835d78')
install="falco-dkms.install"

_driver="7.0.0+driver"

package() {
    install -d "${pkgdir}/usr/src/falco-${pkgver}"
    for _src in "${srcdir}/falco-${pkgver}-${arch}/usr/src/falco-${_driver}/"*; do
       [[ -f "$_src" ]] && install -Dm644 "$_src" "${pkgdir}/usr/src/falco-${pkgver}/$(basename "$_src")"
    done
    install -Dm644 "${srcdir}/falco-dkms.service" "${pkgdir}/usr/lib/systemd/system/falco-dkms.service"
}
