# Maintainer: Ashwin Vishnu <y4d71nsar@relay.firefox.com>
# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
# Contributor: Corpswalker <corpswalker@gmail.com>
pkgname=micromamba-bin
pkgver=2.0.4.0
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
sha512sums_x86_64=('fb7fd104047d486976b1c5e6250d52889be004d3af676a75b5d4639a5ac6689f2e2464bf56c19d76c7d139c64ecb9dc882bdd0f422f7ad033ff60fff5110e9d0')
sha512sums_aarch64=('3e8b53d81d195d4ca5dc211f54aa0ce7e479dccb53cf1f2dafac3a2bc2195d67740226a4892239ff7c454530ce62a330e0a13fe774cb98c1b2340cdacb7d4b2f')
sha512sums_powerpc64le=('5ff183aed4d3ec51aa00c10b1c4a7c50b35b85044fad8fb88fbb50bb50c612d3ee5e4a8852c76acea5036e23b59cf70c8a28802ac75bbe4d2baa9312d5239cb6')

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
