# Maintainer: Muflone http://www.muflone.com/contacts/english/
# Contributor: Alexey Stukalov <astukalov@gmail.com>
pkgname=smartsynchronize
pkgver=3.4.4
pkgrel=1
pkgdesc="Comparing Directories the Smart Way"
arch=("any")
url="http://www.syntevo.com/smartsynchronize/index.html"
license=('custom')
depends=('java-runtime' 'gtk2' 'gtk-update-icon-cache')
source=("http://www.syntevo.com/downloads/${pkgname}/${pkgname}-generic-${pkgver//\./_}.tar.gz"
        "${pkgname}.desktop")
sha256sums=('ffbfd78554f0d7eab7f1080e3ded67504160c21979c1da5464abf3c114be8b89'
            'ee21447d20ef52b65f5becb7a004c10acb925d4219d42f3be2aae61115d9f52f')
install="${pkgname}.install"

package() {
  # Install desktop file
  install -m 755 -d "${pkgdir}/usr/share/applications"
  install -m 755 -t "${pkgdir}/usr/share/applications" "${pkgname}.desktop"
  cd "${pkgname}"
  # Install license files
  install -m 755 -d "${pkgdir}/usr/share/licenses/${pkgname}"
  install -m 644 -t "${pkgdir}/usr/share/licenses/${pkgname}" license.html licenses/*
  # Install documentation files
  install -m 755 -d "${pkgdir}/usr/share/doc/${pkgname}"
  install -m 644 -t "${pkgdir}/usr/share/doc/${pkgname}" readme-linux.txt changelog.txt smartsynchronize.pdf
  # Install launcher files
  install -m 755 -d "${pkgdir}/usr/lib/${pkgname}/bin"
  install -m 755 -t "${pkgdir}/usr/lib/${pkgname}/bin" bin/smartsynchronize.sh
  install -m 755 -d "${pkgdir}/usr/bin"
  ln -s "/usr/lib/${pkgname}/bin/smartsynchronize.sh" "${pkgdir}/usr/bin/${pkgname}"
  # Install library files
  install -m 755 -d "${pkgdir}/usr/lib/${pkgname}/lib"
  install -m 644 -t "${pkgdir}/usr/lib/${pkgname}/lib" lib/*
  # Install icon files
  for _size in 32 48 64 128 256
  do
    install -m 644 -D "bin/${pkgname}-${_size}.png" "${pkgdir}/usr/share/icons/hicolor/${_size}x${_size}/apps/${pkgname}.png"
  done
}
