# Maintainer: Ashwin Vishnu <y4d71nsar@relay.firefox.com>
# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
# Contributor: Corpswalker <corpswalker@gmail.com>
_base=mamba
pkgname=micro${_base}-bin
pkgver=1.5.3
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
sha512sums_x86_64=('02570e91dca173f5315681d80eb61a67b2a64a497f46dab04fc7c1b5ac8de2e2144fc6711af8501edba05693779fa52b31a797115b773597b8b01f0ebf19eedd')
sha512sums_aarch64=('bbcbcb8aa3e71c5f5b28363bf9bcd9eaace1d95f4187518db2e58db27f8f4625bfb4ea8c02b07a240504a0cc5934d8b0271ff39bae335495ee91f81c7e9eac99')

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
