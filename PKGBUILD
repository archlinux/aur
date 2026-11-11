# Maintainer: agony <27015 at riseup dot net>

pkgname=all-smi-bin
pkgver=0.28.1
pkgrel=1
pkgdesc='Command-line utility for monitoring GPU hardware (prebuilt)'
arch=('x86_64' 'aarch64')
url='https://github.com/lablup/all-smi'
license=('Apache-2.0')
depends=('glibc' 'libdrm' 'libgcc')
provides=("all-smi=${pkgver}")
conflicts=('all-smi')
backup=('etc/default/all-smi')
_release="${url}/releases/download/v${pkgver}"
_raw="https://raw.githubusercontent.com/lablup/all-smi/v${pkgver}"
source=("all-smi-${pkgver}.service::${_raw}/packaging/systemd/all-smi.service"
        "all-smi-${pkgver}.sysusers::${_raw}/debian/all-smi.sysusers"
        "all-smi-${pkgver}.default::${_raw}/debian/all-smi.default")
source_x86_64=("all-smi-${pkgver}-x86_64.tar.gz::${_release}/all-smi-linux-x86_64.tar.gz")
source_aarch64=("all-smi-${pkgver}-aarch64.tar.gz::${_release}/all-smi-linux-aarch64.tar.gz")
sha256sums=('64316c3974ec055c4edf9ace4366a658eb3f5f75bcd2d2d2eabe1eb698841d61'
            '3c515d5ed296f482bebc0ad16508cf4010004722adc959df1378f42bc4d20f1c'
            'e7d8f95f2c0511f675eb91ae351fc13333e065704047fce1f33268e9a77d7e5b')
sha256sums_x86_64=('e1f67795c49f5271b71a18ffb70b1e519ebf0eab732ec0e3d42e2d2185d39369')
sha256sums_aarch64=('655642f211678c9e64a8d51d4dfd58651cb6e745de0b7e25becb1700bf6a5979')

package() {
  install -Dm755 all-smi -t "${pkgdir}/usr/bin"
  install -Dm755 liball_smi_amd.so -t "${pkgdir}/usr/lib/all-smi"
  install -Dm644 all-smi.1 -t "${pkgdir}/usr/share/man/man1"
  install -Dm644 "all-smi-${pkgver}.service" "${pkgdir}/usr/lib/systemd/system/all-smi.service"
  install -Dm644 "all-smi-${pkgver}.sysusers" "${pkgdir}/usr/lib/sysusers.d/all-smi.conf"
  install -Dm644 "all-smi-${pkgver}.default" "${pkgdir}/etc/default/all-smi"
}
