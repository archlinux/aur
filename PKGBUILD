# Maintainer: Rafael Baboni Dominiquini <rafaeldominiquini@gmail.com>

pkgname=dabadee
_pkgname="DaBaDee"
pkgver=0.6.0
pkgrel=3
pkgdesc="DaBaDee is a simple deduplication tool/storage for files. It uses SHA256* to hash the files and store them in the storage, replacing the original path with a hardlink to the storage location."
arch=(any)
url="https://github.com/mirkobrombin/${_pkgname}"
_urlraw="https://raw.githubusercontent.com/mirkobrombin/${_pkgname}/v${pkgver}/"
license=(MIT)
source=("${pkgname}_${pkgver}::${url}/releases/download/v${pkgver}/dabadee"
		"LICENSE_${pkgver}::${_urlraw}/LICENSE"
		"README_${pkgver}::${_urlraw}/README.md")
sha256sums=('9c702ebecbc06510fb28414db22b9cb71e646cad9b0472351606cf04471ae982'
            'e3f962b6c7b77b062ccf9c1509a4541d1e051b850330eb3b461e9b487463b509'
            '069fc63c8cef35c1853aaaebefc2a306249cc897a1a07248272ccc2a3195b946')

build() {
  chmod +x ${pkgname}_${pkgver}

  ./${pkgname}_${pkgver} completion bash > ${pkgname}.bash
  ./${pkgname}_${pkgver} completion zsh > ${pkgname}.zsh
  ./${pkgname}_${pkgver} completion fish > ${pkgname}.fish
}

package() {
  install -D -m755 ./${pkgname}_${pkgver} "${pkgdir}/usr/bin/${pkgname}"

  install -D -m644 "${srcdir}/${pkgname}.bash" "${pkgdir}/usr/share/bash-completion/completions/${pkgname}"
  install -D -m644 "${srcdir}/${pkgname}.zsh" "${pkgdir}/usr/share/zsh/site-functions/_${pkgname}"
  install -D -m644 "${srcdir}/${pkgname}.fish" "${pkgdir}/usr/share/fish/vendor_completions.d/${pkgname}.fish"

  install -D -m644 "${srcdir}/LICENSE_${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -D -m644 "${srcdir}/README_${pkgver}" "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}
