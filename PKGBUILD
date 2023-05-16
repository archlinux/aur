# Maintainer: Ashwin Vishnu <y4d71nsar@relay.firefox.com>
# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
# Contributor: Corpswalker <corpswalker@gmail.com>
_base=mamba
pkgname=micro${_base}-bin
pkgver=1.4.3
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
sha512sums_x86_64=('e8b9c047e9dd8b4954e7f67d074d36726972d9f979f2d8d2ad63b84c4b9fa0826f2f4aa0948dc798a2763aa0f7fe4f5fbf395f33b7c6f7a4d845a2fc3c0d9717')
sha512sums_aarch64=('596120af11a43ede9d80c17e03210144caddcf53d854a3ee45e981691d8680bb51ba05b14ca5bfd323215ad62d69ef1f7f28bb897bcc6c8edc80ae782b05f569')

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
