# Maintainer: FabioLolix
# Maintainer: Hanna Rose <imhxnna@gmail.com>
# Contributor: Kaizhao Zhang <zhangkaizhao@gmail.com>

pkgname=odin-dev-bin
_pkgver=2022-05
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="A fast, concise, readable, pragmatic and open sourced programming language."
arch=(x86_64)
url="https://odin-lang.org/"
license=(BSD)
depends=(llvm11-libs)
makedepends=(patchelf)
provides=(odin)
conflicts=(odin)
options=(!strip)
source=("odin-dev-${_pkgver}.tar.gz::https://github.com/odin-lang/Odin/archive/refs/tags/dev-${_pkgver}.tar.gz")
source_x86_64=("https://github.com/odin-lang/Odin/releases/download/dev-${_pkgver}/ubuntu_amd64_dev-${_pkgver}.zip")
sha256sums=('44d178c74f8e5f1b0fbf6c3d2a3e85ec56a20f64bc17bbd46e1ea8da1e77479c')
sha256sums_x86_64=('95bdb6ad929c22d3d6dc3ad9935b2aa9ad7be7c02da80472cb4384d67d8df540')

build() {
  #cd "${srcdir}/ubuntu_artifacts"
  patchelf --replace-needed libLLVM-11.so.1 libLLVM-11.so odin
}

package() {
  #cd "${srcdir}/ubuntu_artifacts/"

  install -d "${pkgdir}/usr/bin"
  install -d "${pkgdir}/usr/lib/odin"

  chmod +x odin
  cp odin "${pkgdir}/usr/lib/odin/odin"
  cp -r core "${pkgdir}/usr/lib/odin/core"

  ln -s "/usr/lib/odin/odin" "${pkgdir}/usr/bin/odin"

  install -Dm644 "${srcdir}/Odin-dev-${_pkgver}/README.md" "${pkgdir}/usr/share/doc/odin/README.md"
  install -Dm644 "${srcdir}/Odin-dev-${_pkgver}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  cp -r "${srcdir}/Odin-dev-${_pkgver}/examples" "${pkgdir}/usr/share/doc/odin/examples"
  cp -r "${srcdir}/Odin-dev-${_pkgver}/vendor" "${pkgdir}/usr/lib/odin/vendor"
}
