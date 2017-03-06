# Maintainer: Danilo Kuehn <dk[at]nogo-software[dot]de>

_pkgname=packer
pkgname=packer-io
pkgver=0.12.3
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
  '096b8762ff0dd7b95736ba690617b02c34576915fa1a4b60d99af9ed9f3a1006'
  '070675905e14b839420282b280a15a7a72ed34c78ad403532ecd3ed5d9768459'
)
else
source=(
  "${_pkgname}-${pkgver}.zip::https://releases.hashicorp.com/packer/${pkgver}/packer_${pkgver}_linux_amd64.zip"
  'https://raw.githubusercontent.com/mitchellh/packer/master/contrib/zsh-completion/_packer'
)
sha256sums=(
  'd11c7ff78f546abaced4fcc7828f59ba1346e88276326d234b7afed32c9578fe'
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
