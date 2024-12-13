# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

_pkgname="phylum"
pkgname="${_pkgname}-bin"
pkgver=7.2.0
pkgrel=1
pkgdesc="Command line interface for the Phylum API"
arch=('x86_64' 'aarch64')
url="https://phylum.io"
_url="https://github.com/phylum-dev/cli"
license=('MIT')
depends=('gcc-libs' 'glibc' 'zlib')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
_pkgsrc="${_pkgname}-${pkgver}"
noextract=("${_pkgsrc}-"{x86_64,aarch64}".zip")
source=("README-${pkgver}.md::${_url}/raw/v${pkgver}/README.md"
        "LICENSE-${pkgver}::${_url}/raw/v${pkgver}/LICENSE")
source_x86_64=("${_pkgsrc}-x86_64.zip::${_url}/releases/download/v${pkgver}/${_pkgname}-x86_64-unknown-linux-gnu.zip")
source_aarch64=("${_pkgsrc}-aarch64.zip::${_url}/releases/download/v${pkgver}/${_pkgname}-aarch64-unknown-linux-gnu.zip")
b2sums=('7bbbd36aed8c996faf29a232455b265edc26dd5eac6f814f00d0a8af6174269f55c86fc3e6ddf26d7c8f33fdd59ab2bf1b20f483f47cc8d49f0490a4500a33c0'
        'd23d56095390a883bd5c4a2fd321bfe027477e24222332936f15c2653614efe93322776f9c6011102fd33210079a01edaa22ffb2326ca5187a6bf9bc50d7ca7e')
b2sums_x86_64=('de92fb9e5c42bce3e96b6da309c1a13f137cb7c8e7e42054cb8b4fad5af1c8ea823ef32f7ca1db87a7e7adca6e144b8414114666f39b6d52d8845ca078751aa4')
b2sums_aarch64=('51dbd73c845e0cdc7d41539e032b6eef8ad5a22166003cd7fa7e951bc24b525a497d7ce9387c40113b843a0af94810856b4cc7f7845090a09d348264f326fd07')

prepare() {
  cd "${srcdir}"
  mkdir -p "${srcdir}/${_pkgsrc}-${CARCH}"
  bsdtar -xf "${_pkgsrc}-${CARCH}.zip" --strip-components 1 -C "${srcdir}/${_pkgsrc}-${CARCH}"
}

package() {
  cd "${srcdir}"
  install -vDm644 "README-${pkgver}.md" "${pkgdir}/usr/share/doc/${_pkgname}/README.md"
  install -vDm644 "LICENSE-${pkgver}"   "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"

  cd "${_pkgsrc}-${CARCH}"
  install -vDm755 "${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"

  cd "completions"
  install -vDm644 "${_pkgname}.bash" "${pkgdir}/usr/share/bash-completion/completions/${_pkgname}"
  install -vDm644 "${_pkgname}.fish" "${pkgdir}/usr/share/fish/vendor_completions.d/${_pkgname}.fish"
  install -vDm644 "_${_pkgname}"     "${pkgdir}/usr/share/zsh/site-functions/_${_pkgname}"
}
