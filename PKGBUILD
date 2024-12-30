# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

_binname="decoder"
pkgname="qmc-decoder"
_commit_rel="097651da070f4b3cf871f56405a6759638ad173a" # 2.5
_commit="fb1e04b03246db406e9fc15c4426b79ed321e4f5" # r24
pkgver="2.5+r24+g${_commit::7}"
pkgrel=1
pkgdesc="Convert QMC3/QMC0/QMCFLAC files to MP3 or FLAC"
arch=('x86_64')
url="https://github.com/Presburger/${pkgname}"
license=('MIT')
depends=('gcc-libs' 'glibc')
makedepends=('ghc-filesystem')
_pkgsrc="${pkgname}-${_commit}"
source=("${_pkgsrc}.tar.gz::${url}/archive/${_commit}.tar.gz")
b2sums=('c99360886a3d817c899b00785a51ba9753beb7e21a5569dc46eee10cfcaaec5f18d84c397e58b833e733c48a1da608504f56fc936f9bd0217eddcadf9ef2829d')

build() {
  cd "${srcdir}/${_pkgsrc}/src"
  g++ ${CFLAGS} ${LDFLAGS} -std=c++11 -o "${pkgname}" "${_binname}.cpp"
}

package() {
  cd "${srcdir}/${_pkgsrc}"
  install -vDm755 "src/${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
  install -vDm644 "README.md"      "${pkgdir}/usr/share/doc/${pkgname}/README.md"
  install -vDm644 "LICENSE"        "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
