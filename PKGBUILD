# Maintainer: Kaizhao Zhang <zhangkaizhao@gmail.com>

_name=XSStrike

pkgname=xsstrike
pkgver=3.0.3
pkgrel=1
pkgdesc="Most Advanced XSS Detection Suite"
arch=('any')
url="https://somdev.me/XSStrike/"
license=('GPL3')
depends=('python>=3.4' 'python-tld' 'python-fuzzywuzzy' 'python-requests')
options=(!emptydirs)
source=("https://github.com/s0md3v/XSStrike/archive/${pkgver}.tar.gz")
sha256sums=('788280b05c638b4ba96dfd8850872efb153e6bd7a7a5cb150cdc17fd4d824cba')

prepare() {
  rm -rf "${pkgdir}/usr/lib/${pkgname}"
}

package() {
  cd "${srcdir}"

  install -d "${pkgdir}/usr/bin"
  install -d "${pkgdir}/usr/lib/${pkgname}"

  cp -r "${srcdir}"/"${_name}"-"${pkgver}"/{core,db,xsstrike.py} "${pkgdir}/usr/lib/${pkgname}/"
  chmod +x "${pkgdir}/usr/lib/${pkgname}/xsstrike.py"
  ln -s "/usr/lib/${pkgname}/xsstrike.py" "${pkgdir}/usr/bin/xsstrike"

  cd "${srcdir}/${_name}-${pkgver}"
  install -Dm644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
