# Maintainer: Danilo Kuehn <dk[at]nogo-software[dot]de>

_pkgname=packer
pkgname=packer-io
pkgver=1.0.2
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
  '0bd45d1e6df2198eec62daaf78f78c0165a00fdfcd38d9a3bd9353ee853b14bb'
  '070675905e14b839420282b280a15a7a72ed34c78ad403532ecd3ed5d9768459'
)
else
source=(
  "${_pkgname}-${pkgver}.zip::https://releases.hashicorp.com/packer/${pkgver}/packer_${pkgver}_linux_amd64.zip"
  'https://raw.githubusercontent.com/mitchellh/packer/master/contrib/zsh-completion/_packer'
)
sha256sums=(
  '13774108d10e26b1b26cc5a0a28e26c934b4e2c66bc3e6c33ea04c2f248aad7f'
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
