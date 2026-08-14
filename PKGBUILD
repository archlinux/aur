# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_pkgname="DaBaDee"
pkgname=${_pkgname,,}
pkgver=2.0.1
pkgrel=1
pkgdesc="DaBaDee is a simple deduplication tool/storage for files. It uses SHA256* to hash the files and store them in the storage, replacing the original path with a hardlink to the storage location."
arch=(any)
url="https://github.com/mirkobrombin/${_pkgname}"
_urlraw="https://raw.githubusercontent.com/mirkobrombin/${_pkgname}/v${pkgver}/"
license=("Apache-2.0")
source=("${pkgname}_${pkgver}::${url}/releases/download/v${pkgver}/dabadee"
		"LICENSE_${pkgver}::${_urlraw}/LICENSE"
		"README_${pkgver}::${_urlraw}/README.md")
sha256sums=('b98a01d361f5d22440131d70b49fadc02141951f7007b1c268c72ce4c4c9976b'
            'c71d239df91726fc519c6eb72d318ec65820627232b2f796219e87dcf35d0ab4'
            '2073cf33372add347c4cd0c4223624e0db3751112b0bdee86d91fb16a214c40a')

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
