# Maintainer: Muflone http://www.muflone.com/contacts/english/

pkgname=smartcvs
pkgver=7.1.9
pkgrel=1
pkgdesc="Smart, complete and powerful CVS client"
arch=("any")
url="https://www.syntevo.com/smartcvs/"
license=('custom')
depends=('java-runtime>=8' 'gtk3' 'gtk-update-icon-cache')
source=("https://www.syntevo.com/downloads/${pkgname}/${pkgname}-generic-${pkgver//\./_}.tar.gz"
        "${pkgname}.desktop")
sha256sums=('1928cca230a2e4c5d2e5dae846e490a2bb3c6feff6f9823ee9c9a1a0f7bfe366'
            'c0bcdc7533f7f44e63d19096a40604a8616eb749029c37489fd4f0114cd530e9')

package() {
  # Install desktop file
  install -m 755 -d "${pkgdir}/usr/share/applications"
  install -m 755 -t "${pkgdir}/usr/share/applications" "${pkgname}.desktop"
  cd "${pkgname}-${pkgver//\./_}"
  # Install license files
  install -m 755 -d "${pkgdir}/usr/share/licenses/${pkgname}"
  install -m 644 -t "${pkgdir}/usr/share/licenses/${pkgname}" license.html
  # Install documentation files
  install -m 755 -d "${pkgdir}/usr/share/doc/${pkgname}"
  install -m 644 -t "${pkgdir}/usr/share/doc/${pkgname}" changelog.txt smartcvs-reference.pdf smartcvs-tutorial.pdf
  # Install launcher files
  install -m 755 -d "${pkgdir}/usr/lib/${pkgname}/bin"
  install -m 755 -t "${pkgdir}/usr/lib/${pkgname}/bin" bin/smartcvs.sh
  install -m 755 -d "${pkgdir}/usr/bin"
  ln -s "/usr/lib/${pkgname}/bin/smartcvs.sh" "${pkgdir}/usr/bin/${pkgname}"
  # Install library files
  install -m 755 -d "${pkgdir}/usr/lib/${pkgname}/lib"
  install -m 644 -t "${pkgdir}/usr/lib/${pkgname}/lib" lib/*
  install -m 755 -d "${pkgdir}/usr/lib/${pkgname}/sources"
  install -m 644 -t "${pkgdir}/usr/lib/${pkgname}/sources" sources/*
  # Install icon files
  for _size in 32 48 64 128
  do
    install -m 644 -D "bin/${pkgname}-${_size}x${_size}.png" "${pkgdir}/usr/share/icons/hicolor/${_size}x${_size}/apps/${pkgname}.png"
  done
}
