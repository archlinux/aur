# Maintainer: Ashwin Vishnu <y4d71nsar@relay.firefox.com>
# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
# Contributor: Corpswalker <corpswalker@gmail.com>
_base=mamba
pkgname=micro${_base}-bin
pkgver=0.27.0
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
sha512sums_x86_64=('b83fc78c0a5c9031e1a595b43447d59cc37b1b57d0e9fe57594aafa602ad3657214cd2cfc1b0d0aeb9c8dcbed6a19d56308806cca5ce08a1b09e355a53c20651')
sha512sums_aarch64=('f76594f4c08720ec1322dc3e231f21d70ea5cbedf611944aa63b708bac37d963129a56e6ea65b62682b0fe4ecd75cbfa6b5f955f5b3c298c2b81885447db1eef')

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
