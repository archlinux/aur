# Maintainer: Ashwin Vishnu <y4d71nsar@relay.firefox.com>
# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
_base=mamba
pkgname=micro${_base}-bin
pkgver=0.25.1
pkgrel=1
pkgdesc="Tiny version of mamba, the fast conda package installer"
arch=('x86_64')
url="https://github.com/${_base}-org/${_base}"
license=('custom:BSD-3-clause')
source=("${pkgname%-bin}-${pkgver}.tar.bz2::https://api.anaconda.org/download/conda-forge/${pkgname%-bin}/${pkgver}/linux-64/${pkgname%-bin}-${pkgver}-0.tar.bz2")
options=(strip)
depends=(glibc)
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
sha512sums=('d4aefd2fdce6e2abbc1f0f5b0a7bbc92d1b4f397993fa2c07d091f80e7eab7d46c37a1256803d493613a91e79da9735bcf26d64873b63cf4d5b575c46a377ef1')

check() {
  export PREFIX="${srcdir}"
  export PATH="${PREFIX}/bin:${PATH}"
  echo "Testing with ${PREFIX}/bin/${pkgname%-bin}"
  bash info/test/run_test.sh
}

package() {
  install -Dm775 "bin/${pkgname%-bin}" "${pkgdir}/usr/bin/${pkgname%-bin}"
  install -Dm 644 info/licenses/LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
