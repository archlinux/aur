# Maintainer: Ashwin Vishnu <y4d71nsar@relay.firefox.com>
# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
_base=mamba
pkgname=micro${_base}-bin
pkgver=0.24.0
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
sha512sums=('82eae2399fdad476dff2891a728c73ad82a3fc6b72d1f9cc0eaf38d328dae1b368cba54393749f858ce34c1545323a3a69442f2efd57fe3b9dacdc04d4130983')

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
