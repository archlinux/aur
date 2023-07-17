# Maintainer: Ashwin Vishnu <y4d71nsar@relay.firefox.com>
# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
# Contributor: Corpswalker <corpswalker@gmail.com>
_base=mamba
pkgname=micro${_base}-bin
pkgver=1.4.9
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
sha512sums_x86_64=('5ff55583bba0e5be9998d7551d9ec0562b88cca757e49caa7e6167185e865831c47d65dfbf764082d336329abdf402dd2243b46322f755b4e23f88744312638c')
sha512sums_aarch64=('a3df581446862912b057ad6a40a526a098612ea171949783231812931c2facb47310bb9cb3a2fbf273cd389120f2e6ddd82b9b56699293117eaf4a6eeb03a68d')

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
