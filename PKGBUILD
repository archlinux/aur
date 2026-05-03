# Maintainer: Ashwin Vishnu <y4d71nsar@relay.firefox.com>
# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
# Contributor: Corpswalker <corpswalker@gmail.com>
pkgname=micromamba-bin
pkgver=2.6.0.0
_pkgver=${pkgver%.*}-${pkgver##*.}
pkgrel=1
pkgdesc="Tiny version of mamba, the fast conda package installer"
arch=(x86_64 aarch64 powerpc64le)
url="https://github.com/mamba-org/mamba"
license=(BSD-3-clause)
source_x86_64=(${pkgname%-bin}-${pkgver}-x86_64.tar.bz2::https://api.anaconda.org/download/conda-forge/${pkgname%-bin}/${pkgver%.*}/linux-64/${pkgname%-bin}-${_pkgver}.tar.bz2)
source_aarch64=(${pkgname%-bin}-${pkgver}-aarch64.tar.bz2::https://api.anaconda.org/download/conda-forge/${pkgname%-bin}/${pkgver%.*}/linux-aarch64/${pkgname%-bin}-${_pkgver}.tar.bz2)
source_powerpc64le=(${pkgname%-bin}-${pkgver}-powerpc64le.tar.bz2::https://api.anaconda.org/download/conda-forge/${pkgname%-bin}/${pkgver%.*}/linux-ppc64le/${pkgname%-bin}-${_pkgver}.tar.bz2)
options=(strip)
depends=(glibc)
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
sha512sums_x86_64=('407a818244fad9d6f5d5f4ac912127bf78edad5d3d0b5b559107b614acd578a627b516b37397be058d20220b8622c7fb3806460408e2d67df2e722702ccd55e0')
sha512sums_aarch64=('e3e2a15aaade2a0afa336aec7b7dd8eba4954c0b2923104c5ae2075e7dcd7026273fe88430b44fc67fdab885d1df6e876a3902bbfd1f9af95826f3a002bfd722')
sha512sums_powerpc64le=('e72d60b64f51499d3a917c948c3c072a2cdc2e580222be7ae4f56c5624b103bd082ef8d088c489ae396a0477b370d4c80653d0df393417d08b61e91850bf9552')

check() {
  export PREFIX="${srcdir}"
  export PATH="${PREFIX}/bin:${PATH}"
  echo "Testing with ${PREFIX}/bin/${pkgname%-bin}"
  bash info/test/run_test.sh
}

package() {
  install -Dm775 "bin/${pkgname%-bin}" "${pkgdir}/usr/bin/${pkgname%-bin}"
  install -Dm 644 info/licenses/mamba/LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
