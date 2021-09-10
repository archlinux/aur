# Maintainer: SoftwareRat

pkgname=hostminder
pkgver=0.0.5
pkgrel=1
pkgdesc="This simple GUI allows you to easily update your /etc/hosts file to one of four consolidated hosts files from StevenBlack/hosts."
arch=('x86_64')
url="https://github.com/jeremehancock/hostminder"
license=('MIT')
depends=("gtk3")
source=("https://github.com/jeremehancock/hostminder/raw/main/deb/${pkgname}_${pkgver}_all.deb")
noextract=("${pkgname}_${pkgver}_all.deb")
sha256sums=('a907dad5f7685920cef7c41af3be5d8ab2f0a213d7ed137146a0b1c5b77dd02b')

package() {
  bsdtar -O -xf "${pkgname}_${pkgver}_all.deb" data.tar.xz | bsdtar -C "${pkgdir}" -xJf -

  # Permissions fix
  find "${pkgdir}" -type d -exec chmod 755 {} \;

  # Move license
  install -dm755 "${pkgdir}/usr/share/licenses/${pkgname}"
  mv "${pkgdir}/usr/share/doc/${pkgname}/copyright" "${pkgdir}/usr/share/licenses/${pkgname}"
}
