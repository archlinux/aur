# Maintainer: Ashwin Vishnu <y4d71nsar@relay.firefox.com>
# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
# Contributor: Corpswalker <corpswalker@gmail.com>
pkgname=micromamba-bin
pkgver=2.6.2.1
_pkgver=${pkgver%.*}-${pkgver##*.}
pkgrel=1
pkgdesc="Tiny version of mamba, the fast conda package installer"
arch=(x86_64 aarch64 powerpc64le)
url="https://github.com/mamba-org/mamba"
license=(BSD-3-clause)
source_x86_64=(${pkgname%-bin}-${pkgver}-x86_64.tar.bz2::https://api.anaconda.org/download/conda-forge/${pkgname%-bin}/${pkgver%.*}/linux-64/${pkgname%-bin}-${_pkgver}.tar.bz2)
source_aarch64=(${pkgname%-bin}-${pkgver}-aarch64.tar.bz2::https://api.anaconda.org/download/conda-forge/${pkgname%-bin}/${pkgver%.*}/linux-aarch64/${pkgname%-bin}-${_pkgver}.tar.bz2)
source_powerpc64le=(${pkgname%-bin}-${pkgver}-powerpc64le.tar.bz2::https://api.anaconda.org/download/conda-forge/${pkgname%-bin}/${pkgver%.*}/linux-ppc64le/${pkgname%-bin}-${_pkgver}.tar.bz2)
options=(strip)
depends=(glibc)
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
sha512sums_x86_64=('2a2c64807633c3a9ce056b0140d8bdb28a44a5fb54ba1d8903cc9f58d5d9a7c70d68025add4ad82fc41bb7aadd590f42ba105d331171f2c383ef248597d2623e')
sha512sums_aarch64=('a9941f60a289231de33fd7af12f70d095c969faba9343f6fae67a2283c6b6f417982db4a95280963cf220d453c6c236837289783ffa1ac42495330298fec94fb')
sha512sums_powerpc64le=('376c6205d7f8102e0d78bf2c21d1e0f89d1754b3b2f0c6d3ec9d8a4bb8780f59514b5c161f42b0cbd131b719a5f5a98e26575ac024ebebebbdbe6cfcd61b4d5b')

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
