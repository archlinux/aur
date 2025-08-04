# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

_sdk=9.0
_Name="CSharpier"
_pkgname="${_Name,,}"
pkgname="${_pkgname}-bin"
pkgver=1.1.1
pkgrel=1
pkgdesc="An opinionated code formatter for C#"
arch=('any')
url="https://csharpier.com"
_url="https://github.com/belav/${_pkgname}"
license=('MIT')
depends=("aspnet-runtime-${_sdk}" 'sh')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
# options=('!strip' '!debug')
_pkgsrc="${_pkgname}-${pkgver}"
source=("${_pkgsrc}.nupkg::https://globalcdn.nuget.org/packages/${_pkgname}.${pkgver}.nupkg?packageVersion=${pkgver}"
        "${_pkgsrc}-CHANGELOG.md::${_url}/raw/refs/tags/${pkgver}/CHANGELOG.md"
        "${_pkgsrc}-LICENSE::${_url}/raw/refs/tags/${pkgver}/LICENSE"
        "${_pkgname}.sh")
sha256sums=('0748a3a969b7799df54fe0b9cd1af84e499f3ec39fb1e687a463d865fe588b0e'
            '4eea4ff005a20264393b70821d03c826b866cb194c7083a307b624a29f62bfc6'
            '0ed797a602216813b874392c4668e5e5611fc9e3b89af6a1989add2e3d825b37'
            '2e2b5bfbaea154aef2bf5aedeb7ed2f8821c0a14227b80128fbd39c83c7cef89')

package() {
  cd "${srcdir}"
  install -vDm755 "${_pkgname}.sh"          "${pkgdir}/usr/bin/${_pkgname}"
  install -vDm644 "README.md"               "${pkgdir}/usr/share/doc/${_pkgname}/README.md"
  install -vDm644 "${_pkgsrc}-CHANGELOG.md" "${pkgdir}/usr/share/doc/${_pkgname}/CHANGELOG.md"
  install -vDm644 "${_pkgsrc}-LICENSE"      "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"

  cd "tools/net${_sdk}/any"
  install -vd "${pkgdir}/usr/lib/${_pkgname}"
  cp -vr --no-preserve=ownership . "${pkgdir}/usr/lib/${_pkgname}"
}
