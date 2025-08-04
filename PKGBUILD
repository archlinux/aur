# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

_sdk=9.0
_Name="Husky"
_pkgname="${_Name,,}"
pkgname="${_pkgname}-bin"
pkgver=0.7.2
pkgrel=1
pkgdesc="Brings the dev-dependency concept to the .NET world!"
arch=('any')
url="https://alirezanet.github.io/Husky.Net/"
_url="https://github.com/alirezanet/husky.net"
license=('MIT')
depends=("dotnet-runtime-${_sdk}" 'sh')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
# options=('!strip' '!debug')
_pkgsrc="${_pkgname}-${pkgver}"
source=("${_pkgsrc}.nupkg::https://globalcdn.nuget.org/packages/${_pkgname}.${pkgver}.nupkg?packageVersion=${pkgver}"
        "${_pkgsrc}-LICENSE::${_url}/raw/refs/tags/v${pkgver}/LICENSE"
        "${_pkgname}.sh")
sha256sums=('13dc04338991b9808ed5c876a840d02da15e79b546962183b0a06c660a216b16'
            'c48257bf48a7afec6f36a79f286343f75404545ae5ba93d04a90d84f9f801539'
            '0cf517982f6b9aa27117bdd4241d04c80dc97ceea01713d1b83d3c61eda36f28')

if   [ "${CARCH}" = 'aarch64' ]; then _msarch=arm64;
elif [ "${CARCH}" = 'armv7h'  ]; then _msarch=arm;
elif [ "${CARCH}" = 'i686'    ]; then _msarch=x86;
elif [ "${CARCH}" = 'x86_64'  ]; then _msarch=x64; fi

package() {
  cd "${srcdir}"
  install -vDm755 "${_pkgname}.sh"     "${pkgdir}/usr/bin/${_pkgname}"
  install -vDm644 "README.md"          "${pkgdir}/usr/share/doc/${_pkgname}/README.md"
  install -vDm644 "${_pkgsrc}-LICENSE" "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"

  cd "tools/net${_sdk}/any"
  install -vd "${pkgdir}/usr/lib/${_pkgname}"
  cp -vr --no-preserve=ownership . "${pkgdir}/usr/lib/${_pkgname}"
}
