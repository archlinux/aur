# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

_pkgname="dbxcli"
pkgname="${_pkgname}-bin"
pkgver=3.2.1
pkgrel=2
pkgdesc="A command line client for Dropbox built using the Go SDK"
arch=(
  'aarch64'
  'x86_64'
)
url="https://github.com/dropbox/${_pkgname}"
license=(
  'Apache-2.0'
)
provides=(
  "${_pkgname}"
)
conflicts=(
  "${_pkgname}"
)
_pkgsrc="${url##*/}-${pkgver}"
source=(
  "${_pkgsrc}-README.md::${url}/raw/refs/tags/v${pkgver}/README.md"
  "${_pkgsrc}-LICENSE::${url}/raw/refs/tags/v${pkgver}/LICENSE"
  "${_pkgsrc}.bash::${url}/raw/refs/tags/v${pkgver}/contrib/dbxcli_bash_completion.sh"
  "${_pkgsrc}.zsh::${url}/raw/refs/tags/v${pkgver}/contrib/zsh-completion/_dbxcli"
)
source_aarch64=(
  "${_pkgsrc}-aarch64::${url}/releases/download/v${pkgver}/${_pkgname}-linux-arm64"
)
source_x86_64=(
  "${_pkgsrc}-x86_64::${url}/releases/download/v${pkgver}/${_pkgname}-linux-amd64"
)
sha256sums=('48b06c47c9bfd23c496f847ec03f2a31e626a8b24a048c637a2583caca2269ef'
            '0d70849e238c190dfcfac96d23d9808c2336cb1ba0550182311d7a496a9c313d'
            '90f530cf861c7a7d2c032a9918ca7ff8c375bf8f5022eb5d39576959d4b30d57'
            '8eb1f132c8711e13ff469c16ca4cb39a6cb94f6ebb17b7c485ef43a7999eac4e')
sha256sums_aarch64=('1ea0750be17fdf87ef60ce8c5da711b60e8a44867ff778b3a0c02d41f0108b9f')
sha256sums_x86_64=('7b9e3b35a23c8c1259862ba28c24468d203690c689226afc4fa5b7cb4e1c7b7a')

# prepare() {
#   cd "${srcdir}"
#   chmod +x ./"${_pkgsrc}-${CARCH}"
#   mkdir -p "completions"
# }

# build() {
#   for _sh in bash fish powershell zsh; do
#     ./"${_pkgsrc}-${CARCH}" completion "${_sh}" > "completions/${_pkgname}.${_sh}"
#   done
# } 

package() {
  cd "${srcdir}"
  install -vDm755 "${_pkgsrc}-${CARCH}"  "${pkgdir}/usr/bin/${_pkgname}"
  install -vDm644 "${_pkgsrc}-README.md" "${pkgdir}/usr/share/doc/${_pkgname}/README.md"
  install -vDm644 "${_pkgsrc}-LICENSE"   "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
  install -vDm644 "${_pkgsrc}.bash"      "${pkgdir}/usr/share/bash-completion/completions/${_pkgname}"
  install -vDm644 "${_pkgsrc}.zsh"       "${pkgdir}/usr/share/zsh/site-functions/_${_pkgname}"

  # cd "completions"
  # install -vDm644 "${_pkgname}.bash" "${pkgdir}/usr/share/bash-completion/completions/${_pkgname}"
  # install -vDm644 "${_pkgname}.fish" "${pkgdir}/usr/share/fish/vendor_completions.d/${_pkgname}.fish"
  # install -vDm644 "${_pkgname}.powershell" "${pkgdir}/usr/share/powershell/Completions/${_pkgname}.ps1"
  # install -vDm644 "${_pkgname}.zsh" "${pkgdir}/usr/share/zsh/site-functions/_${_pkgname}"
}
