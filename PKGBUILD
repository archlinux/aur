# Maintainer: Keinv Yue <k3vinyue@gmail.com>

_pkgname_prefix=globalprotect-openconnect
pkgname="${_pkgname_prefix}-git"
pkgver="2.3.1"
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

sha256sums_x86_64=("3f50723b3468bb2609b5f4531996f60757bfdfe1b5c671534605708b21cf7cc7")
sha256sums_aarch64=("dec8425085e7b3a9619542570d563949a60f0a2420b9d09dca76bd3f86e9ab10")

options=('!strip')

package() {
  cd "${_pkgname_prefix}_${pkgver}"
  make DESTDIR="${pkgdir}" install

  # Remove GPGUI from the package, it will be downloaded at the runtime
  rm -f "${pkgdir}/usr/bin/gpgui"
}

