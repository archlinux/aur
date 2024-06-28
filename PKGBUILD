# Maintainer: vitaliikuzhdin <vitaliikuzhdin@gmail.com>

_pkgname="grafterm"
pkgname="${_pkgname}-bin"
pkgver=0.2.0
pkgrel=1
pkgdesc="Metrics dashboards on terminal (a grafana inspired terminal version)"
arch=('x86_64' 'aarch64' 'armv7h')
url="https://github.com/slok/${_pkgname}"
license=('Apache-2.0')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
_pkgsrc="${_pkgname}-${pkgver}"
source=("${_pkgsrc}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
source_x86_64=("${_pkgname}::${url}/releases/download/v${pkgver}/${_pkgname}-linux-amd64")
source_aarch64=("${_pkgname}::${url}/releases/download/v${pkgver}/${_pkgname}-linux-arm64")
source_armv7h=("${_pkgname}::${url}/releases/download/v${pkgver}/${_pkgname}-linux-arm-v7")
sha256sums=('00832f5f9882afead6048be8c6221f3ddd95325376b370b7f25b87cc4d840b21')
sha256sums_x86_64=('9ce9a95394a5c53bab322421ef1cde8df1badc589c71baee4fece7b5ecd03bbe')
sha256sums_aarch64=('b6e97b0b73b60ac8d36d5580384b8a706af0ba6bd0ae198a28980849b045ffa5')
sha256sums_armv7h=('45d3ed9fd78a7c294c2f44fe53919748b5b02c4e44ad1ea0e5f430133e2b4a92')

package() {
  cd "${srcdir}"
  install -Dm755 "${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"

  cd "${_pkgsrc}"
  install -Dm644 "Readme.md" "${pkgdir}/usr/share/doc/${_pkgname}/README.md"
  install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"

  find "docs" -mindepth 1 -type f -exec install -Dm644 "{}" "${pkgdir}/usr/share/doc/${_pkgname}/" \;
  find "dashboard-examples" -type f -exec install -Dm644 "{}" "${pkgdir}/usr/share/doc/${_pkgname}/{}" \;
}