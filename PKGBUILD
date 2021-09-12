# Maintainer: SoftwareRat

pkgname=hostminder
pkgver=0.0.5
pkgrel=1
pkgdesc="This simple GUI allows you to easily update your hosts file from StevenBlack/hosts"
arch=('x86_64')
url="https://github.com/jeremehancock/hostminder"
license=('MIT')
depends=('gtk3' 'zenity')
source=("https://github.com/jeremehancock/hostminder/raw/main/deb/${pkgname}_${pkgver}_all.deb")
noextract=("${pkgname}_${pkgver}_all.deb")
sha256sums=('7afbd4783491bf85fc1d27292b72cea63c7b72ae036c4afe4fa5ca0641ccec3b')

package() {
  bsdtar -O -xf "${pkgname}_${pkgver}_all.deb" data.tar.xz | bsdtar -C "${pkgdir}" -xJf -

  # Permissions fix
  find "${pkgdir}" -type d -exec chmod 755 {} \;

  # Move license
  install -dm755 "${pkgdir}/usr/share/licenses/${pkgname}"
  mv "${pkgdir}/usr/share/doc/${pkgname}/copyright" "${pkgdir}/usr/share/licenses/${pkgname}"
}
