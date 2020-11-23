# Maintainer: Alexander Bruegmann <mail[at]abruegmann[dot]eu>
# Contributor: Anton Palgunov <toxblh@gmail.com>

pkgname=1password-bin
_pkgname=1Password
_binname=1password
pkgver=0.9.5
_pkgver=0.9.5-2
pkgrel=1
pkgdesc="Password manager and secure wallet (development preview)"
arch=('x86_64')
depends=('libxss' 'gtk3' 'nss')
license=('custom:LicenseRef-1Password-Proprietary')
url='https://1password.com/'
source=("https://onepassword.s3.amazonaws.com/linux/debian/pool/main/1/1password/1password-$_pkgver.deb")
sha256sums=('422c9ba693ab17d3b475c62c282990204a1697967c170a4c9c99308ad9cf4c52')

package() {
  bsdtar -xv -C "${pkgdir}" -f "${srcdir}/data.tar.xz"

  chmod 0644 "${pkgdir}/usr/share/polkit-1/actions/com.1password.1Password.policy"
  chmod 4755 "${pkgdir}/opt/1Password/chrome-sandbox" || true

  mkdir -p "${pkgdir}/usr/bin/"
  ln -s "/opt/${_pkgname}/${_binname}" "${pkgdir}/usr/bin"
}
