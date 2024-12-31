# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

pkgname="macrofun"
_commit="543262399b06d08f4fc6f41eebdc4df88c41eb76" # r6
pkgver="r6+g${_commit::7}"
pkgrel=1
pkgdesc="Standards-defying functional-programming macros for the C preprocessor"
arch=('any')
url="https://github.com/mcinglis/${pkgname}"
license=('MIT')
checkdepends=('bash')
_pkgsrc="${pkgname}-${_commit}"
source=("${_pkgsrc}.tar.gz::${url}/archive/${_commit}.tar.gz")
b2sums=('61bcdf696e3accf8add95de7be6a5bd2d0f6444707796bb527dc72f658280157b43648bfcf96ff11f59c98646e42eaa6bf8e5b14ee17676aef83635252ffb21f')

check() {
  cd "${srcdir}/${_pkgsrc}"
  chmod +x ./tests/run.bash
  ./tests/run.bash
}

package() {
  cd "${srcdir}/${_pkgsrc}"
  find . -maxdepth 1 -type f -name "*.h" -exec \
    install -vDm644 "{}" "${pkgdir}/usr/include/${pkgname}/{}" \;

  install -vDm644 "README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"
  install -vDm644 "LICENSE"   "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

# vim:set ts=2 sw=2 et:
