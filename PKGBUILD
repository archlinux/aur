# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

_name="jule"
_pkgname="${_name}c"
pkgname="${_pkgname}-bin"
pkgver=0.2.2
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
_pkgsrc="${_name}"
source_aarch64=(
  "${_url}/releases/download/${_name}${pkgver}/${_name}${pkgver}-linux-arm64.tar.xz"
)
source_x86_64=(
  "${_url}/releases/download/${_name}${pkgver}/${_name}${pkgver}-linux-amd64.tar.xz"
)
sha256sums_aarch64=('51869e112cf935b65e3e6ffbddf3961e44ac6e70f3aefd4a5d52deb88805c929')
sha256sums_x86_64=('25714777e073a2dc09cb1b03e5971fe573083ecb62fee3a74b6e3e9cc3561aa8')

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
