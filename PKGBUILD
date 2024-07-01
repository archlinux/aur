# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>
# Contributor: Naoki Kanazawa <nk dot naoki912 at gmail dot com>

_pkgname="usacloud"
pkgname="${_pkgname}-bin"
pkgver=1.14.1
pkgrel=1
pkgdesc="CLI client for the Sakura Cloud"
arch=('x86_64' 'i686' 'aarch64' 'arm')
url="https://github.com/sacloud/${_pkgname}"
license=('Apache-2.0')
source_x86_64=("${url}/releases/download/v${pkgver}/${_pkgname}_linux-amd64.zip")
source_i686=("${url}/releases/download/v${pkgver}/${_pkgname}_linux-386.zip")
source_aarch64=("${url}/releases/download/v${pkgver}/${_pkgname}_linux-arm64.zip")
source_arm=("${url}/releases/download/v${pkgver}/${_pkgname}_linux-arm.zip")
sha256sums_x86_64=('860d20a1b46653de996abde93db362f951b3abd596d10152c679ead1b384b2ce')
sha256sums_i686=('0bee6f72ca7b8088cc333bfbb11bcf3cfbb55d4e72c74734b4d634b1cbf0281e')
sha256sums_aarch64=('a4acb6f8cb57e44869afae33f5d0206e3a1c027478e87725cfd921f2288b4dfb')
sha256sums_arm=('84de35aeadb3add7e6b42aa0e0d2e9f40496460508b3d8d682392219942106f0')

prepare() {
  [ -d "completions" ] || mkdir "completions"
  for _sh in bash fish zsh; do
    ./"${_pkgname}" completion "${_sh}" > "completions/${_pkgname}.${_sh}"
  done
}

package() {
  cd "${srcdir}"
  install -Dm755 "${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"
  install -Dm644 "README.md" "${pkgdir}/usr/share/doc/${_pkgname}/README.md"
  install -Dm644 "LICENSE.txt" "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"

  cd "completions"
  install -Dm644 "${_pkgname}.bash" "${pkgdir}/usr/share/bash-completion/completions/${_pkgname}"
  install -Dm644 "${_pkgname}.fish" "${pkgdir}/usr/share/fish/vendor_completions.d/${_pkgname}.fish"
  install -Dm644 "${_pkgname}.zsh"  "${pkgdir}/usr/share/zsh/site-functions/_${_pkgname}"
}
