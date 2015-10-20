# Maintainer: Rock Neurotiko <miguelglafuente@gmail.com>
# Contributor: Sergio Conde <skgsergio@gmail.com>

pkgname=discord
pkgver=0.1.1
pkgrel=2
pkgdesc='Discord linux App'
arch=('i686' 'x86_64')
url='https://github.com/XNBlank/discord-linux'
license=('MIT')

source_x86_64=("https://github.com/XNBlank/discord-linux/archive/x64-${pkgver}.tar.gz")
sha256sums_x86_64=('e5c1c9599ddf708570baa1a3103600211d14ca6d69dbcb5b0fc471aec0c30cb0')

source_i386=("https://github.com/XNBlank/discord-linux/archive/x86-${pkgver}.tar.gz")
sha256sums_i386=('9bd4b4a57baf2f87f33f5e61b772f5c51c314f2874f30ec710620106a95a47fa')

package() {
  case $CARCH in
    'i686') _arch='x86';;
    'x86_64') _arch='x64';;
  esac

  install -d "${pkgdir}/usr/share/discord"
  cp -a "${srcdir}/${pkgname}-linux-${_arch}-${pkgver}/." "${pkgdir}/usr/share/discord/"

  install -d "${pkgdir}/usr/bin"
  ln -s "/usr/share/discord/discord" "${pkgdir}/usr/bin/discord"

  install -Dm644 "${pkgdir}/usr/share/discord/LICENSE" "${pkgdir}/usr/share/licenses/discord/LICENSE"
  rm "${pkgdir}/usr/share/discord/LICENSE"

  chmod 755 "${pkgdir}/usr/share/discord/discord"

  # Dirty hack... we should tell the developer to store settings in user home...
  chmod 666 "${pkgdir}/usr/share/discord/resources/app/init.json"
}
