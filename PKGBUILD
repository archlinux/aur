# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

_name="jule"
_pkgname="${_name}c"
pkgname="${_pkgname}-bin"
pkgver=0.2.0
pkgrel=1
pkgdesc="Jule programming language compiler"
arch=(
  'aarch64'
  'x86_64'
)
url="https://jule.dev"
_url="https://github.com/julelang/${_name}"
license=(
  'BSD-3-Clause'
)
optdepends=(
  'clang: clang backend support'
  'gcc: gcc backend support'
)
provides=(
  "${_pkgname}"
)
conflicts=(
  "${_pkgname}"
)
_pkgsrc="${_pkgname}-${pkgver}"
source_aarch64=(
  "${_pkgsrc}-aarch64.zip::${_url}/releases/download/${_name}${pkgver}/${_name}-linux-arm64.zip"
)
source_x86_64=(
  "${_pkgsrc}-x86_64.zip::${_url}/releases/download/${_name}${pkgver}/${_name}-linux-amd64.zip"
)
sha256sums_aarch64=('194534665638e13972efaf2a66bf3ab45f3f461a9e4aac83602a294f3ac4ed20')
sha256sums_x86_64=('3c59592382fbfd491bf111dccc5333f8b7f64e1536b7fa8b91702700d94ddbb6')

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
