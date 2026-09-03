# Maintainer: fuero <fuerob@gmail.com>
pkgname=x86-64-level
# renovate: datasource=github-tags depName=HenrikBengtsson/x86-64-level
pkgver=0.3.0
pkgrel=1
pkgdesc='Get the x86-64 microarchitecture level on the current machine'
arch=('any')
url="https://github.com/HenrikBengtsson/x86-64-level"
source=(
  "${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/${pkgver}.tar.gz"
)
sha256sums=('d0e9fd8c1181e4a43390e84992b4e0398a398ae069235c6c4b23c23da7df265e')
license=('CC-BY-SA-4.0')
depends=(
  bash
)
checkdepends=(
  make
  shellcheck
)

package() {
  cd "${pkgname}-${pkgver}"
  install -Dm0755 "${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
  for _file in *.md
  do
    install -Dm644 "${_file}" "${pkgdir}/usr/share/doc/${pkgname}/$(basename "${_file}")"
  done
}

check() {
  cd "${pkgname}-${pkgver}"
  make check
}
