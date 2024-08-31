# Maintainer: Ashwin Vishnu <y4d71nsar@relay.firefox.com>
# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
# Contributor: Corpswalker <corpswalker@gmail.com>
_base=mamba
pkgname=micro${_base}-bin
pkgver=1.5.9
pkgrel=1
pkgdesc="Tiny version of mamba, the fast conda package installer"
arch=(x86_64 aarch64)
url="https://github.com/${_base}-org/${_base}"
license=(BSD-3-clause)
source_x86_64=("${pkgname%-bin}-${pkgver}-x86_64.tar.bz2::https://api.anaconda.org/download/conda-forge/${pkgname%-bin}/${pkgver}/linux-64/${pkgname%-bin}-${pkgver}-0.tar.bz2")
source_aarch64=("${pkgname%-bin}-${pkgver}-aarch64.tar.bz2::https://api.anaconda.org/download/conda-forge/${pkgname%-bin}/${pkgver}/linux-aarch64/${pkgname%-bin}-${pkgver}-0.tar.bz2")
options=(strip)
depends=(glibc)
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
sha512sums_x86_64=('7b89d9c44cc9819007b8c890bdc23780c1cfa3296329b2db3fcb14b9318ad11de413a83236985b844e6183d6991ccb5afc7fadd2a9a784ae7302d4e1d371256c')
sha512sums_aarch64=('14d7d6516b21741c0ecad76f49b80adee78c3f5832c3c55d0baad523de217cf39c7ed6be9800eca5681217cdeedbc08fba47d0f4baca4f5475e1c9f303d5ee74')

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
