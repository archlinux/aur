# Maintainer: FabioLolix
# Maintainer: Hanna Rose <imhxnna@gmail.com>
# Contributor: Kaizhao Zhang <zhangkaizhao@gmail.com>

pkgname=odin-dev-bin
_pkgver=2022-03
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
source_x86_64=("https://github.com/odin-lang/Odin/releases/download/dev-${_pkgver}/odin-ubuntu-dev-${_pkgver}.zip")
sha256sums=('6bf8f60978b6f8968aa723e1dd92a975c6ce3f811190369ba9019f37328f1852')
sha256sums_x86_64=('69d5e71841f986cd536c86eac17365eed8b27c51f91d1c1be1edcacc8e150628')

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
