# Maintainer: Rock Neurotiko <miguelglafuente@gmail.com>
# Contributor: Sergio Conde <skgsergio@gmail.com>

pkgname=discord
pkgver=0.1.5
pkgrel=3
pkgdesc='Discord linux App'
arch=('i686' 'x86_64')
url='https://github.com/XNBlank/discord-linux'
provides=('discord')
conflicts=('discord')
license=('MIT')
depends=('gtk2' 'gconf')
optdepends=('freetype2-infinality: If you have black screens with emojis install this.')


source=('Discord.desktop')
source_i686=("https://github.com/XNBlank/discord-linux/archive/x86-${pkgver}.tar.gz")
source_x86_64=("https://github.com/XNBlank/discord-linux/archive/x64-${pkgver}.tar.gz")
sha256sums=('0826f0a07a567d3d966563151329e3e155bf47da528f0698bd677cb46cc468de')
sha256sums_i686=('70bba92a003f31d6eb9ea2e1cdcdbcbd37cd4f6f0fe38561b162fe0b1906c970')
sha256sums_x86_64=('623cbabb05963f0bbd002a919ce5a5c85c134684d4f36037d13bd247b2233010')


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
