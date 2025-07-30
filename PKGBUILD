# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

_name="jule"
_pkgname="${_name}c"
pkgname="${_pkgname}-bin"
pkgver=0.1.6
pkgrel=1
pkgdesc="Jule programming language compiler"
arch=('aarch64' 'x86_64')
url="https://jule.dev"
_url="https://github.com/julelang/${_name}"
license=('BSD-3-Clause')
depends=('gcc-libs' 'glibc')
optdepends=('clang: clang backend support'
            'gcc: gcc backend support')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
_pkgsrc="${_pkgname}-${pkgver}"
source_aarch64=("${_pkgsrc}-aarch64.zip::${_url}/releases/download/${_name}${pkgver}/${_name}-linux-arm64.zip")
source_x86_64=("${_pkgsrc}-x86_64.zip::${_url}/releases/download/${_name}${pkgver}/${_name}-linux-amd64.zip")
sha256sums_aarch64=('15f2c21b9d42befe13c3131de8065f9ea137e45f957e8621e031795565f6ab79')
sha256sums_x86_64=('dab66372add13cd7d98a70fd0a446dd3d855e04f1d8a18e4e71d1a960961d72a')

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
