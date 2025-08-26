# Maintainer: Mercas <me@smj.im>

pkgname=anytype-alpha
pkgver=0.49.9
_tag="-alpha" # -alpha, -beta or leave blank
pkgrel=1
pkgdesc="The everything app for those who celebrate trust & autonomy(extract binary pkg)"
arch=('x86_64')
url="https://anytype.io/"
license=('custom')
depends=('glibc' 'glib2' 'nss' 'gcc-libs' 'bash' 'libxss' 'libsecret')
optdepends=('org.freedesktop.secrets: auto login support')
conflicts=('anytype-bin'
  'anytype-electron-bin'
  'anytype-alpha-bin')
options=('!strip' '!debug')
source=("https://github.com/anyproto/anytype-ts/releases/download/v${pkgver}${_tag}/anytype_${pkgver}${_tag}_amd64.deb"
  "anytype.sh")
sha256sums=('f99c18ec9a7e945bef69f55628381cb3f7561c8f8a2f49e966b30622f19ea75d'
            '8688c3f1f2b7e43b1f033549dd8018b7d2d2a9523e4d12995bce43d768e17c3a')

package() {
  echo "Extract data.tar.xz ..."
  bsdtar -xf "${srcdir}/data.tar.xz" -C "${pkgdir}"
  mkdir -p "${pkgdir}/usr/bin"
  echo "Custom flags should be put directly in: ~/.config/anytype-flags.conf"
  install -Dm755 "${srcdir}/anytype.sh" "${pkgdir}/usr/bin/anytype"
}
