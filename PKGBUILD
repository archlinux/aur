# Maintainer: Nico <d3sox at protonmail dot com>
# Contributor: Liviu Cristian Mirea-Ghiban <liviu dot mirea at wecodepixels dot com>
heidisqlrelease=6908
shortpkgver=12.8
pkgname=heidisql
pkgver=${shortpkgver}.0.${heidisqlrelease}
pkgrel=3
pkgdesc="A lightweight GUI for managing MySQL, PostgreSQL, and Microsoft SQL databases. This package uses the latest nightly build (64bit) on top of the portable version, and uses Wine."
arch=(any)
url="http://www.heidisql.com/"
license=('GPL')
depends=(bash wine)
makedepends=(unzip)
source=("http://www.heidisql.com/downloads/releases/HeidiSQL_${shortpkgver}_64_Portable.zip"
        "http://www.heidisql.com/builds/heidisql64.r${heidisqlrelease}.exe"
        "${pkgname}.png"
        "${pkgname}.desktop"
        "${pkgname}.sh")
sha256sums=('f45964d922d82ce904b4030d8f2479e8045ae7a18ee48670e45efe18797f97e0'
            '7e7f88f111b798f6848da9ac0a8262bc2e02e2fa5899517fc2a6068362c52e03'
            'd0f6c19b7aa4b7a6daa00b658a852f97d35dd98d2c31a2f4ea267527bf5cda15'
            'a0ae92dbc64ab6faac06c28f24bfef8d8efc18810bb876cf1fff8b69f89cfea1'
            'b139c6f0cfc7d8aeacc2c7dd04df833fbb8c77d288e6fa53bf6845aa1e892c54')
noextract=("HeidiSQL_${shortpkgver}_Portable.zip")

package() {
  # Unzip files from the .zip file
  install -d -m755 ${pkgdir}/usr/share/$pkgname
  unzip "$srcdir/HeidiSQL_${shortpkgver}_64_Portable.zip" -d "$srcdir/unzipped"
  
  # Overwrite with nightly build file
  cp "$srcdir/heidisql64.r${heidisqlrelease}.exe" "$srcdir/unzipped/heidisql.exe"
  
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
