# Maintainer: Eric Engestrom <aur [at] engestrom [dot] ch>

pkgname=cov-analysis
pkgver=7.7.0.4
pkgrel=1
pkgdesc='Coverity Scan Build Tool for C/C++ - REQUIRES MANUAL DOWNLOAD'
url='https://scan.coverity.com/download'
arch=('i686' 'x86_64')
license=('custom')
source=("${pkgname}.sh")
md5sums=('d168d266857cdf0bb3908d7a047dfcf3')

source_i686=(  "cov-analysis-linux32-${pkgver}.tar.gz")
source_x86_64=("cov-analysis-linux64-${pkgver}.tar.gz")
md5sums_i686=(  'd51b087127f9576b7cf5e93eb43fda18')
md5sums_x86_64=('937bf3a4c7680e06fd8e993a5d082957')

[ "$CARCH" = 'i686'   ] && _tarball="${source_i686}"
[ "$CARCH" = 'x86_64' ] && _tarball="${source_x86_64}"
noextract=("${_tarball}")

package() {
  install -dm755 "${pkgdir}/opt/${pkgname}"
  cd "${pkgdir}/opt/${pkgname}"
  tar --strip-components=1 -xf "${srcdir}/${_tarball}"

  cd "${srcdir}"
  install -dm755 "${pkgdir}/etc/profile.d"
  sed "s#@PATH@#/opt/${pkgname}/bin/#" "${pkgname}.sh" > "${pkgdir}/etc/profile.d/${pkgname}.sh"
  chmod 755 "${pkgdir}/etc/profile.d/${pkgname}.sh"
}
