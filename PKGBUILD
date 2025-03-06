# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

_name="conflict"
pkgname="${_name}-parser"
_commit="f8386aaaefd83d6cdb54eb14d42b1205a7e7728d" # r15
pkgver="r15+g${_commit::7}"
pkgrel=1
pkgdesc="C++17 command line argument parser"
arch=('any')
url="https://github.com/qookei/${_name}"
license=('Zlib')
makedepends=('meson')
_pkgsrc="${_name}-${_commit}"
source=("${_pkgsrc}.tar.gz::${url}/archive/${_commit}.tar.gz")
sha256sums=('aea1674c6026c60c3b427b10a4524c4eaeb93f7c249e572dfa1b843b49b1c579')

build() {
  local meson_options=(
    -D install_headers=true
    -D build_tests=false
  )

  cd "${srcdir}"
  arch-meson "${_pkgsrc}" "${_pkgsrc}/build" "${meson_options[@]}"
  meson compile -C "${_pkgsrc}/build"
}

# check() {
#   cd "${srcdir}"
#   meson test -C "${_pkgsrc}/build" --print-errorlogs
# }

package() {
  cd "${srcdir}"
  meson install -C "${_pkgsrc}/build" --destdir "${pkgdir}"

  cd "${_pkgsrc}"
  install -vDm644 "README.md"  "${pkgdir}/usr/share/doc/${pkgname}/README.md"
  install -vDm644 "LICENSE.md" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.md"
}
