# Maintainer: Rock Neurotiko<miguelglafuente@gmail.com>

pkgname=discord
pkgver=0.1.1
pkgrel=1
pkgdesc='Discord linux App'
arch=('i686' 'x86_64')
url='https://github.com/XNBlank/discord-linux'
license=('MIT')

case $CARCH in
  'ia32'  ) _arch='x86'; sha256sums=('9bd4b4a57baf2f87f33f5e61b772f5c51c314f2874f30ec710620106a95a47fa');;
  'x86_64') _arch='x64' ; sha256sums=('e5c1c9599ddf708570baa1a3103600211d14ca6d69dbcb5b0fc471aec0c30cb0');;
esac

source=("https://github.com/XNBlank/discord-linux/archive/${_arch}-${pkgver}.tar.gz")

package() {
  cd $srcdir

  install -d "${pkgdir}/usr/share/discord"
  cp -a "${pkgname}-linux-${_arch}-${pkgver}/." "${pkgdir}/usr/share/discord"

  install -d "${pkgdir}/usr/bin"
  ln -s "/usr/share/discord/discord" "${pkgdir}/usr/bin/discord"

  install -Dm644 "${pkgdir}/usr/share/discord/LICENSE" "${pkgdir}/usr/share/licenses/discord/LICENSE"
  rm "${pkgdir}/usr/share/discord/LICENSE"

  find "${pkgdir}" -type d -exec chmod 755 {} +
  find "${pkgdir}" -type f -exec chmod 644 {} +
  chmod 755 "${pkgdir}/usr/share/discord/discord"
}
