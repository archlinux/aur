# Maintainer: Rock Neurotiko <miguelglafuente@gmail.com>
# Contributor: Sergio Conde <skgsergio@gmail.com>

pkgname=discord
pkgver=0.1.3
pkgrel=4
pkgdesc='Discord linux App'
arch=('i686' 'x86_64')
url='https://github.com/XNBlank/discord-linux'
license=('MIT')
depends=('gtk2')

source=('Discord.desktop')
sha256sums=('6b0faff2ddd149a8c9b9b5ca66d9117a6388c3a2e720d3d3f971ae97b2670bee')

source_i686=("https://github.com/XNBlank/discord-linux/archive/x86-${pkgver}-AUR.tar.gz")
sha256sums_i686=('6b8ceaee7e3463cc0c4f3c414be8993fda9fadd8345812747e3628d0f87264fd')

source_x86_64=("https://github.com/XNBlank/discord-linux/archive/x64-${pkgver}-AUR.tar.gz")
sha256sums_x86_64=('8a7189bf1edce61900dacce77a411bcb76256c9aa744f8d970ea1204c236e3b5')

package() {
  case $CARCH in
    'i686') _arch='x86';;
    'x86_64') _arch='x64';;
  esac

  # Install files
  install -d "${pkgdir}/opt/discord"
  cp -a "${srcdir}/${pkgname}-linux-${_arch}-${pkgver}-AUR/." "${pkgdir}/opt/discord/"

  # Make binary executable
  chmod 755 "${pkgdir}/opt/discord/discord"

  # Install desktop entry
  install -d "${pkgdir}/usr/share/applications"
  install "${srcdir}/Discord.desktop" "${pkgdir}/usr/share/applications"

  # Create symbolic link to the main binary
  install -d "${pkgdir}/usr/bin"
  ln -s "/opt/discord/discord" "${pkgdir}/usr/bin/discord"

  # Install license file
  install -Dm644 "${pkgdir}/opt/discord/LICENSE" "${pkgdir}/usr/share/licenses/discord/LICENSE"
  rm "${pkgdir}/opt/discord/LICENSE"

  # Dirty hack... we should tell the developer to store settings in user home...
  chmod 666 "${pkgdir}/opt/discord/resources/app/init.json"
}
