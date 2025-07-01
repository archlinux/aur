# Maintainer: 9M2PJU <9m2pju at hamradio dot my>
# Contributor: morrownr (upstream developer)

pkgname=rtl8852cu-dkms-morrownr-git
pkgver=20250701
pkgrel=1
pkgdesc="Realtek RTL8852CU WiFi driver (DKMS, morrownr's fork, git version)"
arch=('x86_64')
url="https://github.com/9M2PJU/rtl8852cu-20240510-aur"
license=('MIT')
depends=('dkms')
makedepends=('git')
provides=('rtl8852cu-dkms')
conflicts=('rtl8852cu-dkms')
source=("${pkgname}::git+https://github.com/9M2PJU/rtl8852cu-20240510-aur.git"
        'rtl8852cu.install')
md5sums=('SKIP' 'SKIP')
install=rtl8852cu.install

pkgver() {
  date +%Y%m%d
}

package() {
  local moddir="${pkgdir}/usr/src/rtl8852cu-${pkgver}"

  install -d "${moddir}"
  cp -r "${srcdir}/${pkgname}"/* "${moddir}/"
  find "${moddir}" -type d -exec chmod 755 {} +
  find "${moddir}" -type f -exec chmod 644 {} +
  chmod +x "${moddir}"/*.sh
  chmod +x "${moddir}/dkms.conf"
}
