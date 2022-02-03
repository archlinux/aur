# Maintainer : Ashwin Vishnu <y4d71nsar@relay.firefox.com>
# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
_base=mamba
pkgname=micro${_base}-bin
pkgver=0.20.0
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
sha512sums=('a78934cfcde4307eb145986da678033c298c2b9bba06714c74706ce08acc459e4cc8b9d6e3fd6c79c46fc08aacb9e3102f39b1afc402298e02b5bf7497cf193e')

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
