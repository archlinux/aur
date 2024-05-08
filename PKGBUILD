# Maintainer: Keinv Yue <k3vinyue@gmail.com>

_pkgname_prefix=globalprotect-openconnect
pkgname="${_pkgname_prefix}-git"
pkgver="2.2.1"
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

sha256sums_x86_64=("6628844768f4f99a5eff21d534c4049decaa91142a32a398c4f7e54295b18a98")
sha256sums_aarch64=("dc7fcbb598a5150418f5d82f880d978b7b03f98796261242ef2d0055798bba2c")

options=('!strip')

package() {
  cd "${_pkgname_prefix}_${pkgver}"
  make DESTDIR="${pkgdir}" install

  # Remove GPGUI from the package, it will be downloaded at the runtime
  rm -f "${pkgdir}/usr/bin/gpgui"
}

