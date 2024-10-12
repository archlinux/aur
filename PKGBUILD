# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

_pkgname="phylum"
pkgname="${_pkgname}-bin"
pkgver=7.1.2
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
b2sums_x86_64=('a0c4086525d52d791245c17ee468cec68751cd581e3251aa9329e7141476b294c5d592684bd124158c5159b2bf6cb108db243fde3ab17be35c9e166c70007322')
b2sums_aarch64=('d70178ee55eaa9e4faf80638031ac4f48f075e6c22b58823f1f65e3658de6d1dc11ce49cec866a11d381196410a4c6e7b69375277458c7ec60ee13d3478aa578')

prepare() {
  cd "${srcdir}"
  mkdir -p "${srcdir}/${_pkgsrc}-${CARCH}"
  bsdtar -xf "${_pkgsrc}-${CARCH}.zip" --strip-components 1 -C "${srcdir}/${_pkgsrc}-${CARCH}"
}

package() {
  cd "${srcdir}"
  install -Dm644 "README-${pkgver}.md" "${pkgdir}/usr/share/doc/${_pkgname}/README.md"
  install -Dm644 "LICENSE-${pkgver}"   "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"

  cd "${_pkgsrc}-${CARCH}"
  install -Dm755 "${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"

  cd "completions"
  install -Dm644 "${_pkgname}.bash" "${pkgdir}/usr/share/bash-completion/completions/${_pkgname}"
  install -Dm644 "${_pkgname}.fish" "${pkgdir}/usr/share/fish/vendor_completions.d/${_pkgname}.fish"
  install -Dm644 "_${_pkgname}"     "${pkgdir}/usr/share/zsh/site-functions/_${_pkgname}"
}
