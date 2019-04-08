# Maintainer: Kaizhao Zhang <zhangkaizhao@gmail.com>

_name=XSStrike

pkgname=xsstrike
pkgver=3.1.4
pkgrel=1
pkgdesc="Advanced XSS Detection Suite"
arch=('any')
url="https://somdev.me/XSStrike/"
license=('GPL3')
depends=('python>=3.4' 'python-tld' 'python-fuzzywuzzy' 'python-requests')
options=(!emptydirs)
source=("https://github.com/s0md3v/XSStrike/archive/${pkgver}.tar.gz")
sha256sums=('cc94741f825e872a67a8f2b1f3ec5c3048791aa689dc804c713e82f88b9bd188')

prepare() {
  rm -rf "${pkgdir}/usr/lib/${pkgname}"
}

package() {
  cd "${srcdir}"

  install -d "${pkgdir}/usr/bin"
  install -d "${pkgdir}/usr/lib/${pkgname}"

  cp -r "${srcdir}"/"${_name}"-"${pkgver}"/{core,db,modes,plugins,xsstrike.py} "${pkgdir}/usr/lib/${pkgname}/"
  chmod +x "${pkgdir}/usr/lib/${pkgname}/xsstrike.py"
  ln -s "/usr/lib/${pkgname}/xsstrike.py" "${pkgdir}/usr/bin/xsstrike"

  cd "${srcdir}/${_name}-${pkgver}"
  install -Dm644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"
  install -Dm644 CHANGELOG.md "${pkgdir}/usr/share/doc/${pkgname}/CHANGELOG.md"
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
