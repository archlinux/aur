# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

_zig=0.13
pkgname="workspace"
pkgver=1.3.3
pkgrel=1
pkgdesc="Install and manage all your repositories in your chosen destination"
arch=(
  'aarch64'
  'x86_64'
)
url="https://github.com/gaskam/${pkgname}"
license=(
  'MIT'
)
makedepends=(
  "zig${_zig}"
)
_pkgsrc="${url##*/}-${pkgver}"
source=(
  "${_pkgsrc}.tar.gz::${url}/archive/refs/tags/${pkgver}.tar.gz"
)
b2sums=('a74bd399bc7dfc63c3b3fdc805d42dfdf8f15554ce7cdf3772480bcffd63bf91b91842c171c4cdd95eed349292d086f98b3ac48e9da78b643c35678cc354ab58')

build() {
  local zig_options=(
    "src/main.zig"
    -fPIE
    -O ReleaseSafe
    -mcpu=baseline
  )

  cd "${srcdir}/${_pkgsrc}"
  "zig${_zig}" build-exe "${zig_options[@]}" 
}

package() {
  cd "${srcdir}/${_pkgsrc}"
  install -vDm755 "main"      "${pkgdir}/usr/bin/${pkgname}"
  install -vDm644 "README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"
  install -vDm644 "LICENSE"   "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
