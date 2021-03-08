# Maintainer: Anton Palgunov <toxblh@gmail.com>

pkgname=1password-bin
_pkgname=1Password
_binname=1password
pkgver=8.0.27
_pkgver=8.0.27
pkgrel=1
pkgdesc="Password manager and secure wallet (development preview)"
arch=('x86_64')
depends=('libxss' 'gtk3' 'nss')
license=('custom:LicenseRef-1Password-Proprietary')
url='https://1password.com/'
source=("https://downloads.1password.com/linux/debian/pool/main/1/1password/1password-$_pkgver.deb")
sha256sums=('8bf7baeb6777de632b5a43d706e6883ffe5cef30978b21a3386292720876fea9')
validpgpkeys=('3FEF9748469ADBE15DA7CA80AC2D62742012EA22')

package() {
  bsdtar -xv -C "${pkgdir}" -f "${srcdir}/data.tar.xz"

  chmod 0644 "${pkgdir}/opt/1Password/com.1password.1Password.policy"
  chmod 4755 "${pkgdir}/opt/1Password/chrome-sandbox" || true

  mkdir -p "${pkgdir}/usr/bin/"
  ln -s "/opt/${_pkgname}/${_binname}" "${pkgdir}/usr/bin"
}
