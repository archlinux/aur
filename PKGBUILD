# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

pkgname="qmc-decoder"
_commit_rel="097651da070f4b3cf871f56405a6759638ad173a" # 2.5
_commit="fb1e04b03246db406e9fc15c4426b79ed321e4f5" # r24
pkgver="2.5+r24+g${_commit::7}"
pkgrel=2
pkgdesc="Convert QMC3/QMC0/QMCFLAC files to MP3 or FLAC"
arch=(
  'x86_64'
)
url="https://github.com/Presburger/${pkgname}"
license=(
  'MIT'
)
depends=(
  'glibc'
  'libgcc'
  'libstdc++'
)
makedepends=(
  'ghc-filesystem'
)
_pkgsrc="${url##*/}-${_commit}"
source=(
  "${url}/archive/${_commit}/${_pkgsrc}.tar.gz"
  "${pkgname}_gcc15_include_cstdint.patch"
)
b2sums=('c99360886a3d817c899b00785a51ba9753beb7e21a5569dc46eee10cfcaaec5f18d84c397e58b833e733c48a1da608504f56fc936f9bd0217eddcadf9ef2829d'
        'dfa1edfac6b13daa0bc7c34c0e6f928792ed8ce28b741b6a279a8fbdd3a53f5215462e284a8bc82c6deef6e8480d778e8106434094f94fb845f6d45778598dc6')

prepare() {
  cd "${srcdir}/${_pkgsrc}"
  patch -Np1 -i "${srcdir}/${pkgname}_gcc15_include_cstdint.patch"
}

build() {
  cd "${srcdir}/${_pkgsrc}/src"
  g++ ${CFLAGS} ${LDFLAGS} -std=c++11 -o "${pkgname}" "decoder.cpp"
}

package() {
  cd "${srcdir}/${_pkgsrc}"
  install -vDm755 "src/${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
  install -vDm644 "README.md"      "${pkgdir}/usr/share/doc/${pkgname}/README.md"
  install -vDm644 "LICENSE"        "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
