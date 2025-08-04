# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

_sdk=8.0
_pkgname="trx2junit"
pkgname="${_pkgname}-bin"
pkgver=2.1.0
pkgrel=1
pkgdesc="Transforms XML from trx-Testresults to JUnit-Testresults / trx to JUnit XML and the other way round"
arch=('any')
url="https://github.com/gfoidl/${_pkgname}"
license=('MIT')
depends=("dotnet-runtime-${_sdk}" 'sh')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
# options=('!strip' '!debug')
_pkgsrc="${_pkgname}-${pkgver}"
source=("${_pkgsrc}.nupkg::https://globalcdn.nuget.org/packages/${_pkgname}.${pkgver}.nupkg?packageVersion=${pkgver}"
        "${_pkgsrc}-LICENSE::${url}/raw/refs/tags/v${pkgver}/LICENSE"
        "${_pkgname}.sh")
sha256sums=('d05c1f4c4086cad74e5fe9706426239a94cc2ada9f04893ac6e37e15575ea4af'
            '21a3e82baadca8e993d19f11b93b7cb7e4b58ef11061a3165f4019ea6370c96a'
            '1ad695e1ae6a3ac1ceab3149a79e36d72119344129aa22c12d28b93754ea9765')

package() {
  cd "${srcdir}"
  install -vDm755 "${_pkgname}.sh"     "${pkgdir}/usr/bin/${_pkgname}"
  install -vDm644 "ReadMe.md"          "${pkgdir}/usr/share/doc/${_pkgname}/README.md"
  install -vDm644 "${_pkgsrc}-LICENSE" "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"

  cd "tools/net${_sdk}/any"
  install -vd "${pkgdir}/usr/lib/${_pkgname}"
  cp -vr --no-preserve=ownership . "${pkgdir}/usr/lib/${_pkgname}"
}
