# Maintainer: Ashwin Vishnu <y4d71nsar@relay.firefox.com>
# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
# Contributor: Corpswalker <corpswalker@gmail.com>
pkgname=micromamba-bin
pkgver=2.0.2.0
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
sha512sums_x86_64=('e976d02ba3aebbe4b6a1ea36042d8b6dce5ab181c4989859b9e8289160fd45b4b195b8011c0559523ccafa6f34d98bc2661d6a2267c8fbc45cb772199117bf4a')
sha512sums_aarch64=('edd155c6683534a87d6916627dd81ebab3bdbc7959f88af1bd65f70dc2059d7bcc5267981edd29ae29e87f332d3f26b3f0fb7b02e34611a519a3768d2ac36fa8')
sha512sums_powerpc64le=('4f186f93c1eea275a6c4dba0550dba77caa04dffb1199fda068aebef40df4d6fbdf061cd1d2d5aefe6f790c03e20413063ed764f7cdec6e7f7cd9f77ae29cdaa')

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
