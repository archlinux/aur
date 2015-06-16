# Maintainer: Liviu Cristian Mirea-Ghiban <contact at liviucmg dot com>
pkgname=heidisql
pkgver=9.2
pkgrel=1
pkgdesc="A lightweight GUI for managing MySQL and Microsoft SQL databases. Uses Wine. Package repo: https://github.com/WeCodePixels/heidisql-aur"
arch=(any)
url="http://www.heidisql.com/"
license=('GPL')
depends=(bash wine)
makedepends=(unzip)
source=("http://www.heidisql.com/downloads/releases/HeidiSQL_${pkgver}_Portable.zip"
        "${pkgname}.png"
        "${pkgname}.desktop"
        "${pkgname}.sh")
md5sums=('e023fbe06e49b6c12d8d2d232f234353'
         'df3673bc694beceb8ed6cfeace6b6c3f'
         'ea4fc6959a315ef5c2bf8e22c479e22a'
         '3cdbca3164df7d3629ffc469d52e53a0')
noextract=("HeidiSQL_${pkgver}_Portable.zip")

package() {
  # Install files from the .zip file
  install -d -m755 ${pkgdir}/usr/share/$pkgname
  unzip "$srcdir/HeidiSQL_${pkgver}_Portable.zip" -d "$srcdir/unzipped"
  cp -ra "$srcdir/unzipped/"* "${pkgdir}/usr/share/${pkgname}"
  find "${pkgdir}/usr/share/${pkgname}" -type f -exec chmod 644 "{}" \;
  find "${pkgdir}/usr/share/${pkgname}" -type d -exec chmod 755 "{}" \;

  # Install the startup script
  install -Dm755 "${srcdir}/${pkgname}.sh" "${pkgdir}/usr/bin/${pkgname}"

  # Install the icon
  install -Dm644 "${srcdir}/${pkgname}.png" "${pkgdir}/usr/share/pixmaps/${pkgname}.png"

  # Install the .desktop
  install -Dm644 "${srcdir}/${pkgname}.desktop" "${pkgdir}/usr/share/applications/${pkgname}.desktop"
}
