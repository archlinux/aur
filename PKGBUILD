# Maintainer: Caltlgin Stsodaat <contact@fossdaily.xyz>

_pkgname='Insomnia'
pkgname="${_pkgname,,}-bin"
pkgver=2020.4.1
pkgrel=1
pkgdesc='API Client and Design Platform for GraphQL and REST'
arch=('x86_64')
url='https://insomnia.rest'
_url_source='https://github.com/Kong/insomnia'
license=('MIT')
depends=('libappindicator-gtk3' 'libnotify' 'libsecret' 'libxss' 'libxslt' 'nodejs' 'nss' 'xdg-utils')
provides=("${_pkgname,,}")
conflicts=("${_pkgname,,}")
source=("${_url_source}/releases/download/core@${pkgver}/${_pkgname}.Core-${pkgver}.deb"
        "${_pkgname}-${pkgver}-LICENSE::${_url_source}/raw/master/LICENSE")
# NB: updpkgsums: LICENSE == SKIP
sha256sums=('353cf8b0a78c95ee610f72ff2ee825c7bab9805f6ea7995b3aaebce7d8f537d8'
            'SKIP')

package() {
  tar -xvf data.tar.xz -C "${pkgdir}"
  rm -rf "${pkgdir}/usr/share/doc"
  install -d "${pkgdir}/usr/bin"
  ln -sf "/opt/${_pkgname}/${_pkgname,,}" "${pkgdir}/usr/bin/${_pkgname,,}"
  install -Dm644 -t "${pkgdir}/usr/share/licenses/${_pkgname}" \
    "${pkgdir}/opt/${_pkgname}/"{'LICENSE.electron.txt','LICENSES.chromium.html'}
  install -Dm644 "${_pkgname}-${pkgver}-LICENSE" "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
}

# vim: ts=2 sw=2 et:
