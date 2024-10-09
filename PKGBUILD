# Maintainer: Javier Tiá <javier dot tia at gmail dot com>
# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dor com>

_name=sift
pkgname=${_name}-bin
pkgver=0.9.0
pkgrel=3
pkgdesc="A fast and powerful open source alternative to grep"
arch=('i686' 'x86_64' 'aarch64')
url="http://sift-tool.org/"
license=('GPL3')
options=('!strip' '!emptydirs')
makedepends=('help2man')
conflicts=("${_name}")
replaces=("${_name}")
provides=("${_name}=${pkgver}")
source=("README_${pkgver}.md::https://raw.githubusercontent.com/svent/${_name}/refs/tags/v${pkgver}/README.md")
source_i686=("${url}/downloads/${_name}/${_name}_${pkgver}_linux_386.tar.gz")
source_x86_64=("${url}/downloads/${_name}/${_name}_${pkgver}_linux_amd64.tar.gz")
source_aarch64=("${url}/downloads/${_name}/${_name}_${pkgver}_linux_arm.tar.gz")
sha256sums=('8be610c211a21dd9297336a4eb4b14c32655b520baff203f46d0945a24cff57a')
sha256sums_i686=('d1a0362b280b6d80ad348d66a02a4a0758bb8448b3296f9fdb74b048928f5f9d')
sha256sums_x86_64=('980a048d2414e042190d45d84e620295629e267deb16cdf3df2b48f0cb0c4db3')
sha256sums_aarch64=('2d3aae4663105945cc7d88c683ab255bc39dafcb97d4900b81b25bb9ef8238f5')

[[ "$CARCH" = "i686" ]] && _arch='386'
[[ "$CARCH" = "x86_64" ]] && _arch='amd64'
[[ "$CARCH" = "aarch64" ]] && _arch='arm'

build() {
  cd "${srcdir}/${_name}_${pkgver}_linux_${_arch}/"

  help2man ./${_name} --output "MAN-${pkgver}.1"
}

package() {
  cd "${srcdir}/${_name}_${pkgver}_linux_${_arch}/"

  install -Dm 775 "${_name}" "${pkgdir}/usr/bin/${_name}"
  install -Dm 644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm 644 "../README_${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

  install -Dm644 "MAN-${pkgver}.1" "${pkgdir}/usr/share/man/man1/${_name}.1"
  gzip "${pkgdir}/usr/share/man/man1/${_name}.1"
}

# vim:set ft=sh ts=2 sw=2 et:
