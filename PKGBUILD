# Maintainer: Keinv Yue <k3vinyue@gmail.com>

_pkgname_prefix=globalprotect-openconnect
pkgname="${_pkgname_prefix}-git"
pkgver="2.3.7"
pkgrel=1
pkgdesc="A GUI for GlobalProtect VPN, based on OpenConnect, supports the SSO authentication method."
arch=(x86_64 aarch64)
url="https://github.com/yuezk/GlobalProtect-openconnect"
license=('GPL3')
depends=('openconnect>=8.20' webkit2gtk libappindicator-gtk3 libayatana-appindicator libsecret libxml2)
optdepends=('wmctrl: for window management')

conflicts=('globalprotect-openconnect')
provides=('globalprotect-openconnect' 'gpclient' 'gpservice' 'gpauth' 'gpgui')

install=gp.install

source_x86_64=("https://github.com/yuezk/GlobalProtect-openconnect/releases/download/v${pkgver}/globalprotect-openconnect_${pkgver}_x86_64.bin.tar.xz")
source_aarch64=("https://github.com/yuezk/GlobalProtect-openconnect/releases/download/v${pkgver}/globalprotect-openconnect_${pkgver}_aarch64.bin.tar.xz")

sha256sums_x86_64=("6c6aeac6399b2e0c41d608038aed36e3c32ab26d2c25280a737fef9e21600559")
sha256sums_aarch64=("09e012d85ec9ae36ac51cb405d0cc96b5b2aa612737354f668a0dc5a80f76808")

options=('!strip')

package() {
  cd "${_pkgname_prefix}_${pkgver}"
  make DESTDIR="${pkgdir}" install

  # Remove GPGUI from the package, it will be downloaded at the runtime
  rm -f "${pkgdir}/usr/bin/gpgui"
}

