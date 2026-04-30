# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

_name="jule"
_pkgname="${_name}c"
pkgname="${_pkgname}-bin"
pkgver=0.2.1
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
  "${_url}/releases/download/${_name}${pkgver}/${_name}${pkgver}-linux-arm64.zip"
)
source_x86_64=(
  "${_url}/releases/download/${_name}${pkgver}/${_name}${pkgver}-linux-amd64.zip"
)
sha256sums_aarch64=('56e12f30e3e292dea33af9a761921d5c5ab6e46b6549aa885f94e693c455d35d')
sha256sums_x86_64=('3f8ee8680aa94bc6f684221a5710443ace5143c6e4dd406a0388c59f315f6f4f')

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
