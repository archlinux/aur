# Maintainer: Michael Hansen <zrax0111 gmail com>
# Contributor: Anthony Danilov <frimen.c at gmail>
# Contributor: Ondrej Patrovic <ondrej@patrovic.com>

pkgname=010editor
pkgver=13.0

pkgrel=1
pkgdesc="Professional text and hex editing with Binary Templates technology"
arch=('i686' 'x86_64')
url="https://www.sweetscape.com/010editor/"
license=('custom')
depends=('libpng')
makedepends=('fakechroot')
options=('!strip')

source=('010editor.desktop')
source_i686=(https://download.sweetscape.com/010EditorLinux32Installer$pkgver.tar.gz)
source_x86_64=(https://download.sweetscape.com/010EditorLinux64Installer$pkgver.tar.gz)
sha256sums=('e3398b117934840828a96cd33534fc9b9242ec96089c2f283add137975499766')
sha256sums_i686=('b047973dc7a3b2e3a8c8a1c1c7257966e77480744177c0e1bf64a240f069658b')
sha256sums_x86_64=('a53ac2e1d5566157d73af9d93a4702367c44798b17206a8d162507d04d8fecac')

package() {
  cd "${srcdir}"

  _source=source_${CARCH}
  _filename=${!_source##*/}
  _installer=${_filename%%$pkgver*}

  install -dm 755 "${pkgdir}/opt"
  cp -r "${pkgname}" "${_}/"

  # Clean up unnecessary items (assitant is part of qt5-tools)
  rm -r "${pkgdir}/opt/${pkgname}/"{'assistant','uninstall'}

  install -dm 755 "${pkgdir}/usr/bin"
  ln -s "/opt/${pkgname}/010editor" "${_}/010editor"

  install -dm 755 "${pkgdir}/usr/share/pixmaps"
  ln -s "/opt/${pkgname}/010_icon_128x128.png" "${_}/010editor.png"

  install -dm 755 "${pkgdir}/usr/share/licenses/${pkgname}"
  ln -s "/opt/${pkgname}/license.txt" "${_}/license.txt"

  install -Dm 644 '010editor.desktop' "${pkgdir}/usr/share/applications/010editor.desktop"
}
