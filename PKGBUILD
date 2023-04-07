# Maintainer: Ashwin Vishnu <y4d71nsar@relay.firefox.com>
# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
# Contributor: Corpswalker <corpswalker@gmail.com>
_base=mamba
pkgname=micro${_base}-bin
pkgver=1.4.2
pkgrel=1
pkgdesc="Tiny version of mamba, the fast conda package installer"
arch=('x86_64' 'aarch64')
url="https://github.com/${_base}-org/${_base}"
license=('custom:BSD-3-clause')
source_x86_64=("${pkgname%-bin}-${pkgver}-x86_64.tar.bz2::https://api.anaconda.org/download/conda-forge/${pkgname%-bin}/${pkgver}/linux-64/${pkgname%-bin}-${pkgver}-0.tar.bz2")
source_aarch64=("${pkgname%-bin}-${pkgver}-aarch64.tar.bz2::https://api.anaconda.org/download/conda-forge/${pkgname%-bin}/${pkgver}/linux-aarch64/${pkgname%-bin}-${pkgver}-0.tar.bz2")
options=(strip)
depends=(glibc)
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
sha512sums_x86_64=('3277687b882a1cb45839d4cf3f3917976df73ecbb52c514b50a09a4d4cfa0457fcf4bd3b15979fcd0614a69c18113dfd64147bd772c5f9440579bab0d3441e1f')
sha512sums_aarch64=('003a4d0141058eadd696b71e30b8d2de47bc0e61080e3e81d50147c1ea21a3dcf95225815e95d7b7a0cb395adcd512c2dc820690836b6fe6d0de51373463a45e')

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
