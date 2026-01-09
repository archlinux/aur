# Maintainer: Ashwin Vishnu <y4d71nsar@relay.firefox.com>
# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
# Contributor: Corpswalker <corpswalker@gmail.com>
pkgname=micromamba-bin
pkgver=2.5.0.1
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
sha512sums_x86_64=('4b3e680350778c2f741ad19581eb1e891b3d0cf4114accaabfa4ac03a9a5b3d2109579e09a0556a035815461980f8d43ad48ac42e28f4acff2413efd374a65f3')
sha512sums_aarch64=('45f967dfc7860bc432ba1e229276f6c8b01ec881712c289f8311269e5ef51e7742c242b0928e0708e001054f3c80a07a36ffdd0aa452baa1d5aa2ad54c8b1ac5')
sha512sums_powerpc64le=('a815aad5d07772e78d3e3775a2fe334bdfca3ee750f589b2d5030a45ca9a5a187507251dce44a88b02b06c9bbfc007a006b011a44b5f93e972af968abec3b0eb')

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
