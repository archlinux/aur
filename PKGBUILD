# Maintainer: Ashwin Vishnu <y4d71nsar@relay.firefox.com>
# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
# Contributor: Corpswalker <corpswalker@gmail.com>
_base=mamba
pkgname=micro${_base}-bin
pkgver=1.5.8
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
sha512sums_x86_64=('23e3674a5a6de0e1149dd3f53c8bfb09b82939d34b24ac653acc2f5ab72a50fb33c0d65bdf7f8b416f16a22aa55e5ab94f234508be69c069d9e22cdb7f7745f4')
sha512sums_aarch64=('e9383d1b801fac9dd0d899e5ddf917692fd2c4317233a7008cc7c948765a081282dac46dca9a29d8e1de00994ed62f3c9d0f24bbe646e684ebc6aa3aa35e6618')

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
