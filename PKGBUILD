# Maintainer: Danilo Kuehn <dk[at]nogo-software[dot]de>

_pkgname=packer
pkgname=packer-io
pkgver=0.12.1
pkgrel=1
pkgdesc="Packer is a tool for creating identical machine images for multiple platforms from a single source configuration."
url="http://www.packer.io"
arch=('x86_64' 'i686')
license=('MPL2')
depends=('glibc')
if test "$CARCH" == i686; then
source=(
  "${_pkgname}-${pkgver}.zip::https://releases.hashicorp.com/packer/${pkgver}/packer_${pkgver}_linux_386.zip"
  'https://raw.githubusercontent.com/mitchellh/packer/master/contrib/zsh-completion/_packer'
)
sha256sums=(
  'bd8dd7d6a568e3fe38e9065a8396ac1a90e826c075d777aca67d3c2f70580b1b'
  '070675905e14b839420282b280a15a7a72ed34c78ad403532ecd3ed5d9768459'
)
else
source=(
  "${_pkgname}-${pkgver}.zip::https://releases.hashicorp.com/packer/${pkgver}/packer_${pkgver}_linux_amd64.zip"
  'https://raw.githubusercontent.com/mitchellh/packer/master/contrib/zsh-completion/_packer'
)
sha256sums=(
  '456e6245ea95705191a64e0556d7a7ecb7db570745b3b4b2e1ebf92924e9ef95'
  '070675905e14b839420282b280a15a7a72ed34c78ad403532ecd3ed5d9768459'
)
fi

build() {
  sed 's/^#compdef packer/#compdef packer-io/' "${srcdir}/_packer" > "${srcdir}/_packer-io"
}

package() {
  install -dm755 "${pkgdir}/usr/bin"
  install -Dm755 "${srcdir}/${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}-io"
  install -Dm644 ${srcdir}/_packer-io ${pkgdir}/usr/share/zsh/site-functions/_packer-io
}
