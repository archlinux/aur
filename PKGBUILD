# Maintainer: Trystan Sarrade <trystan.sarrade at somanyways dot co>
pkgname=rproc-bin
_pkgname=rproc
pkgver=0.3.7
pkgrel=1
pkgdesc="Resource & process monitor for Linux, inspired by the Windows 11 Task Manager"
arch=('x86_64')
url="https://github.com/Trystan-SA/rproc"
license=('MIT')
depends=(
  'glibc'
  'gcc-libs'
  'fontconfig'
  'libx11'
  'libxcb'
  'libxkbcommon'
  'wayland'
  'libglvnd'
)
optdepends=(
  'systemd: required for the Services and Startup tabs'
  'nvidia-utils: NVIDIA GPU monitoring via NVML'
)
provides=("${_pkgname}")
conflicts=("${_pkgname}")
source=(
  "${_pkgname}-${pkgver}.tar.gz::${url}/releases/download/v${pkgver}/${_pkgname}-v${pkgver}-linux-x86_64.tar.gz"
  "${_pkgname}-${pkgver}.desktop::${url}/raw/v${pkgver}/packaging/io.github.trystan_sa.rproc.desktop"
  "${_pkgname}-${pkgver}.metainfo.xml::${url}/raw/v${pkgver}/packaging/io.github.trystan_sa.rproc.metainfo.xml"
  "${_pkgname}-${pkgver}.svg::${url}/raw/v${pkgver}/packaging/icons/hicolor/scalable/apps/io.github.trystan_sa.rproc.svg"
  "rprocd-${pkgver}.service::${url}/raw/v${pkgver}/packaging/rprocd.system.service"
  "LICENSE-${pkgver}::${url}/raw/v${pkgver}/LICENSE"
)
# Each sum is tagged with the source it covers so the release workflow can
# refresh them in place via sed without parsing the whole block.
sha256sums=(
  '821e721f15c596284aaf92011c8778ff0616f6e1fce8720d16039c552527b38a' # bin
  '52c4f615f92932cadc8ac68bffbabf6d7edbcfbac817163bbfe45e27e4cf307c' # desktop
  '33abc04448deb538c92833dbd6be8eb4edb0439f420f9c0fc79b486641d82795' # metainfo
  '5cab06b8d3e4da5283b55c2c71a109bb8a4e5eb38c113395a40c463d19edc481' # svg
  'c1c42884fd79f02b694186df52dc025afa3cdb67ad31489a73d1dafe31f08f95' # service
  '87f838dd4476de000fa0b1b216e4a6323e1cad587eab2a8066161aa1669cda40' # license
)

package() {
  install -Dm755 "${srcdir}/${_pkgname}" \
    "${pkgdir}/usr/bin/${_pkgname}"
  install -Dm644 "${srcdir}/${_pkgname}-${pkgver}.desktop" \
    "${pkgdir}/usr/share/applications/io.github.trystan_sa.rproc.desktop"
  install -Dm644 "${srcdir}/${_pkgname}-${pkgver}.metainfo.xml" \
    "${pkgdir}/usr/share/metainfo/io.github.trystan_sa.rproc.metainfo.xml"
  install -Dm644 "${srcdir}/${_pkgname}-${pkgver}.svg" \
    "${pkgdir}/usr/share/icons/hicolor/scalable/apps/io.github.trystan_sa.rproc.svg"
  install -Dm644 "${srcdir}/rprocd-${pkgver}.service" \
    "${pkgdir}/usr/lib/systemd/user/rprocd.service"
  install -Dm644 "${srcdir}/LICENSE-${pkgver}" \
    "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
}
