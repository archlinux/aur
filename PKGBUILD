# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

_name="jule"
_pkgname="${_name}c"
pkgname="${_pkgname}-bin"
pkgver=0.1.7
pkgrel=1
pkgdesc="Jule programming language compiler"
arch=('aarch64' 'x86_64')
url="https://jule.dev"
_url="https://github.com/julelang/${_name}"
license=('BSD-3-Clause')
optdepends=(
  'clang: clang backend support'
  'gcc: gcc backend support'
)
provides=("${_pkgname}")
conflicts=("${_pkgname}")
_pkgsrc="${_pkgname}-${pkgver}"
source_aarch64=("${_pkgsrc}-aarch64.zip::${_url}/releases/download/${_name}${pkgver}/${_name}${pkgver}-linux-arm64.zip")
source_x86_64=("${_pkgsrc}-x86_64.zip::${_url}/releases/download/${_name}${pkgver}/${_name}${pkgver}-linux-amd64.zip")
sha256sums_aarch64=('2fc2db18e3883bea4fc8959d90790bbc54642db287f6f887f265a7c832e5adb3')
sha256sums_x86_64=('4f6698e08aa7119077a639e4ae6539cdbceb4a77a2f97c8ba8895738c67f627d')

package() {
  cd "${srcdir}/${_name}"
  find "api" "std" -type f ! -name '*.md' -exec \
    install -Dm644 "{}" "${pkgdir}/usr/lib/${_name}/{}" \;
  find "bin"       -type f ! -name '*.md' -exec \
    install -Dm755 "{}" "${pkgdir}/usr/lib/${_name}/{}" \;

  install -vd "${pkgdir}/usr/bin"
  ln -vsf "/usr/lib/${_name}/bin/${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"

  install -vDm644 "README.md" "${pkgdir}/usr/share/doc/${_pkgname}/README.md"
  install -vDm644 "LICENSE"   "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
}
