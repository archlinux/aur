# Maintainer: Keinv Yue <k3vinyue@gmail.com>

_pkgname_prefix=globalprotect-openconnect
pkgname="${_pkgname_prefix}-git"
pkgver="2.1.2"
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

sha256sums_x86_64=("3f0e1f491c90b5bde8227956c0c9f94bc9ebff665474f022b050872f62e59d6c")
sha256sums_aarch64=("fd50b05e07c5cc1019a31b719b8fb1b1cc7424597d5e0449034a5ef163ee7c60")

options=('!strip')

package() {
  cd "${_pkgname_prefix}_${pkgver}"
  make DESTDIR="${pkgdir}" install

  # Remove GPGUI from the package, it will be downloaded at the runtime
  rm -f "${pkgdir}/usr/bin/gpgui"
}

