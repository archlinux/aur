# Maintainer: Liviu Cristian Mirea-Ghiban <liviu dot mirea at wecodepixels dot com>
heidisqlrelease=5473
shortpkgver=10.1
pkgname=heidisql
pkgver=${shortpkgver}.0.${heidisqlrelease}
pkgrel=1
pkgdesc="A lightweight GUI for managing MySQL, PostgreSQL, and Microsoft SQL databases. This package uses the latest nightly build (32bit) on top of the portable version, and uses Wine."
arch=(any)
url="http://www.heidisql.com/"
license=('GPL')
depends=(bash wine)
makedepends=(unzip)
source=("http://www.heidisql.com/downloads/releases/HeidiSQL_${shortpkgver}_32_Portable.zip"
        "http://www.heidisql.com/builds/heidisql32.r${heidisqlrelease}.exe"
        "${pkgname}.png"
        "${pkgname}.desktop"
        "${pkgname}.sh")
md5sums=('e57bac6d01a7c1c028ef727b19909944'
         '9b0c2f871f364556def607c8ec2eace5'
         'df3673bc694beceb8ed6cfeace6b6c3f'
         'ea4fc6959a315ef5c2bf8e22c479e22a'
         '4500794df628bc141afa07ae65f85289')
noextract=("HeidiSQL_${shortpkgver}_Portable.zip")

package() {
  # Unzip files from the .zip file
  install -d -m755 ${pkgdir}/usr/share/$pkgname
  unzip "$srcdir/HeidiSQL_${shortpkgver}_32_Portable.zip" -d "$srcdir/unzipped"
  
  # Overwrite with nightly build file
  cp "$srcdir/heidisql32.r${heidisqlrelease}.exe" "$srcdir/unzipped/heidisql.exe"
  
  # Install files
  cp -ra "$srcdir/unzipped/"* "${pkgdir}/usr/share/${pkgname}"
  
  # Set proper permissions
  find "${pkgdir}/usr/share/${pkgname}" -type f -exec chmod 644 "{}" \;
  find "${pkgdir}/usr/share/${pkgname}" -type d -exec chmod 755 "{}" \;

  # Install the startup script
  install -Dm755 "${srcdir}/${pkgname}.sh" "${pkgdir}/usr/bin/${pkgname}"

  # Install the icon
  install -Dm644 "${srcdir}/${pkgname}.png" "${pkgdir}/usr/share/pixmaps/${pkgname}.png"

  # Install the .desktop
  install -Dm644 "${srcdir}/${pkgname}.desktop" "${pkgdir}/usr/share/applications/${pkgname}.desktop"
}
