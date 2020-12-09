# Maintainer: Rene Peinthor <peinthor@gmail.com>
# Contributor: Muflone http://www.muflone.com/contacts/english/

pkgname=smartsvn
pkgver=14.0.2
pkgrel=1
pkgdesc="A Subversion (SVN) GUI client written in Java"
arch=("any")
url="https://www.smartsvn.com"
license=('custom')
depends=("jre11-openjdk" "desktop-file-utils" "sh" "hunspell-en_US" "hicolor-icon-theme")
provides=("smartsvn=${pkgver}")
source=("https://www.smartsvn.com/downloads/${pkgname}/${pkgname}-linux-${pkgver//\./_}.tar.gz"
        "${pkgname}.desktop")
sha256sums=('bab1e7c369782077768e83f9c34838cbbe70d28c89c025cb74feaac133a675a9'
            'ab0ef714cdb1ba8f188b04f4accaf661501503234b4cedd335e200498b6e3b35')

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
  install -m 644 -t "${pkgdir}/usr/share/doc/${pkgname}" changelog.txt known-issues.txt readme-linux.txt
  # Install launcher files
  install -m 755 -d "${pkgdir}/usr/lib/${pkgname}/bin"
  install -m 755 -t "${pkgdir}/usr/lib/${pkgname}/bin" bin/smartsvn.sh
  install -m 755 -d "${pkgdir}/usr/bin"
  ln -s "/usr/lib/${pkgname}/bin/smartsvn.sh" "${pkgdir}/usr/bin/${pkgname}"
  # Install library files
  install -m 755 -d "${pkgdir}/usr/lib/${pkgname}/lib"
  install -m 644 -t "${pkgdir}/usr/lib/${pkgname}/lib" lib/*
  # Symlink hunspell dictionaries
  ln -s "/usr/share/hunspell" "${pkgdir}/usr/lib/${pkgname}/dictionaries"
  # Install icon files
  for _size in 32 48 64 128
  do
    install -m 644 -D "bin/${pkgname}-${_size}.png" "${pkgdir}/usr/share/icons/hicolor/${_size}x${_size}/apps/${pkgname}.png"
  done
}
