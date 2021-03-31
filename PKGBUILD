# Maintainer: Anton Palgunov <toxblh@gmail.com>

pkgname=1password-bin
_pkgname=1Password
_binname=1password
pkgver=8.0.32
_pkgver=8.0.32
pkgrel=1
pkgdesc="Password manager and secure wallet (development preview)"
arch=('x86_64')
depends=('libxss' 'gtk3' 'nss')
install='1password.install'
license=('custom:LicenseRef-1Password-Proprietary')
url='https://1password.com/'
source=("https://downloads.1password.com/linux/debian/pool/main/1/1password/1password-$_pkgver.deb")
sha256sums=('d5a20057d72910a0011c05de1cdfd2d0ce4f4f417db7451293fbaa3796b2655b')
validpgpkeys=('3FEF9748469ADBE15DA7CA80AC2D62742012EA22')

package() {
  bsdtar -xv -C "${pkgdir}" -f "${srcdir}/data.tar.xz"

  install -Dm0644 "${pkgdir}/opt/1Password/com.1password.1Password.policy" -t "${pkgdir}/usr/share/polkit-1/actions/"
  chmod 4755 "${pkgdir}/opt/1Password/chrome-sandbox" || true

  install -dm0755 "${pkgdir}/usr/bin"
  ln -s "/opt/${_pkgname}/${_binname}" "${pkgdir}/usr/bin/${_binname}"
}
