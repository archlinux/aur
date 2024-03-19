# Maintainer: Michael Hansen <zrax0111 gmail com>
# Contributor: Anthony Danilov <frimen.c at gmail>
# Contributor: Ondrej Patrovic <ondrej@patrovic.com>

pkgname=010editor
pkgver=14.0.1

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
sha256sums_i686=('7fb771a2104e34d110d8687fed06d19fe374f72585b336e792903bef66c43920')
sha256sums_x86_64=('778a33d5ff7e87e72faeae6e6fbbd2011345a97dcd561974f8116407c3a2375c')

package() {
  cd "${srcdir}"

  _source=source_${CARCH}
  _filename=${!_source##*/}
  _installer=${_filename%%$pkgver*}

  install -dm 755 "${pkgdir}/opt"
  cp -r "${pkgname}" "${_}/"

  # Clean up unnecessary items
  rm -r "${pkgdir}/opt/${pkgname}/uninstall"

  install -dm 755 "${pkgdir}/usr/bin"
  ln -s "/opt/${pkgname}/010editor" "${_}/010editor"

  install -dm 755 "${pkgdir}/usr/share/pixmaps"
  ln -s "/opt/${pkgname}/010_icon_128x128.png" "${_}/010editor.png"

  install -dm 755 "${pkgdir}/usr/share/licenses/${pkgname}"
  ln -s "/opt/${pkgname}/license.txt" "${_}/license.txt"

  install -Dm 644 '010editor.desktop' "${pkgdir}/usr/share/applications/010editor.desktop"
}
