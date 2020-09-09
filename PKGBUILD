# Maintainer: Anton Palgunov <toxblh@gmail.com>

pkgname=1password-bin
_pkgname=1Password
_binname=1password
pkgver=0.8.5
_pkgver=0.8.5-1
pkgrel=1
pkgdesc="Password manager and secure wallet"
arch=('x86_64')
license=('custom:LicenseRef-1Password-Proprietary')
depends=(libxss nss gtk3)
options=(!strip)
url='https://1password.com/'
source=("https://onepassword.s3.amazonaws.com/linux/debian/pool/main/1/1password/1password-$_pkgver.deb")
sha256sums=('77f7c9342906c65517759a3912f865717dd8bfd720219ca1d7486de6a82dbbbc')

package() {
  bsdtar -xv -C "${pkgdir}" -f "${srcdir}/data.tar.xz"

  mkdir -p "${pkgdir}/usr/bin/"

  chmod 644 "${pkgdir}/usr/share/polkit-1/actions/com.1password.1Password.policy"
  chmod 4755 "${pkgdir}/opt/1Password/chrome-sandbox" || true

  ln -s "/opt/${_pkgname}/${_binname}" "${pkgdir}/usr/bin"
}
