# Maintainer: Danilo Kuehn <dk[at]nogo-software[dot]de>

_pkgname=packer
pkgname=packer-io
pkgver=1.0.0
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
  'ee55eeeb225096c497e5afe2ac4770d10a752c6a6f94c413e0ed3927b4692054'
  '070675905e14b839420282b280a15a7a72ed34c78ad403532ecd3ed5d9768459'
)
else
source=(
  "${_pkgname}-${pkgver}.zip::https://releases.hashicorp.com/packer/${pkgver}/packer_${pkgver}_linux_amd64.zip"
  'https://raw.githubusercontent.com/mitchellh/packer/master/contrib/zsh-completion/_packer'
)
sha256sums=(
  'ed697ace39f8bb7bf6ccd78e21b2075f53c0f23cdfb5276c380a053a7b906853'
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
