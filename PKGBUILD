# Maintainer: Rock Neurotiko <miguelglafuente@gmail.com>
# Contributor: Sergio Conde <skgsergio@gmail.com>

pkgname=discord
pkgver=0.1.1
pkgrel=3
pkgdesc='Discord linux App'
arch=('i686' 'x86_64')
url='https://github.com/XNBlank/discord-linux'
license=('MIT')

source=('Discord.desktop')
sha256sums=('6b0faff2ddd149a8c9b9b5ca66d9117a6388c3a2e720d3d3f971ae97b2670bee')

source_i686=("https://github.com/XNBlank/discord-linux/archive/x86-${pkgver}.tar.gz")
sha256sums_i686=('9bd4b4a57baf2f87f33f5e61b772f5c51c314f2874f30ec710620106a95a47fa')

source_x86_64=("https://github.com/XNBlank/discord-linux/archive/x64-${pkgver}.tar.gz")
sha256sums_x86_64=('e5c1c9599ddf708570baa1a3103600211d14ca6d69dbcb5b0fc471aec0c30cb0')

package() {
  case $CARCH in
    'i686') _arch='x86';;
    'x86_64') _arch='x64';;
  esac

  # Install files
  install -d "${pkgdir}/opt/discord"
  cp -a "${srcdir}/${pkgname}-linux-${_arch}-${pkgver}/." "${pkgdir}/opt/discord/"

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
