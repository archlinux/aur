# Maintainer: Anton Palgunov <toxblh@gmail.com>

pkgname=1password-bin
_pkgname=1Password
_binname=1password
pkgver=0.9.14
_pkgver=0.9.14-4
pkgrel=1
pkgdesc="Password manager and secure wallet (development preview)"
arch=('x86_64')
depends=('libxss' 'gtk3' 'nss')
license=('custom:LicenseRef-1Password-Proprietary')
url='https://1password.com/'
source=("https://downloads.1password.com/linux/debian/pool/main/1/1password/1password-$_pkgver.deb")
sha256sums=('d9a8927b78cc33d174ca54c61be50bdeb733afbba5cf048ee83ddcf8bfa32bb3')
validpgpkeys=('3FEF9748469ADBE15DA7CA80AC2D62742012EA22')

package() {
  bsdtar -xv -C "${pkgdir}" -f "${srcdir}/data.tar.xz"

  chmod 0644 "${pkgdir}/opt/1Password/com.1password.1Password.policy"
  chmod 4755 "${pkgdir}/opt/1Password/chrome-sandbox" || true

  mkdir -p "${pkgdir}/usr/bin/"
  ln -s "/opt/${_pkgname}/${_binname}" "${pkgdir}/usr/bin"
}
