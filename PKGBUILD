# Maintainer : Ashwin Vishnu <y4d71nsar@relay.firefox.com>
# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
_base=mamba
pkgname=micro${_base}-bin
pkgver=0.22.0
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
sha512sums=('fa006e3b32a2554f08a39edd61c08e7dd252820c9d02b82781f2e2a0444c1ec2f5c7fad39206834dd422d9cc5d6bbc417eb580dfa2a5d73b72edce9bb3179fad')

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
