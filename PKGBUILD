# Maintainer: Rock Neurotiko <miguelglafuente@gmail.com>
# Contributor: Sergio Conde <skgsergio@gmail.com>

pkgname=discord
pkgver=0.1.4
pkgrel=1
pkgdesc='Discord linux App'
arch=('i686' 'x86_64')
url='https://github.com/XNBlank/discord-linux'
license=('MIT')
depends=('gtk2')

source=('Discord.desktop')

source_i686=("https://github.com/XNBlank/discord-linux/archive/x86-${pkgver}.tar.gz")

source_x86_64=("https://github.com/XNBlank/discord-linux/archive/x64-${pkgver}.tar.gz")
sha256sums=('0826f0a07a567d3d966563151329e3e155bf47da528f0698bd677cb46cc468de')
sha256sums_i686=('733352827f8c264a621383967c69ae98be40ddcfe0fb52e382a44b1787f79d46')
sha256sums_x86_64=('6ea0b71d9f21e2ee3be3f91d615291a63f9b3258184417add8d8c2dc148c6f79')

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

  # Create symbolic link to the icon
  install -d "${pkgdir}/usr/share/pixmaps"
  ln -s "/opt/discord/resources/app/icon.png" "${pkgdir}/usr/share/pixmaps/discord.png"

  # Install license file
  install -Dm644 "${pkgdir}/opt/discord/LICENSE" "${pkgdir}/usr/share/licenses/discord/LICENSE"
  rm "${pkgdir}/opt/discord/LICENSE"

  # Dirty hack... we should tell the developer to store settings in user home...
  # chmod 666 "${pkgdir}/opt/discord/resources/app/init.json"
}
