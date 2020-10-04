# Maintainer: Caltlgin Stsodaat <contact@fossdaily.xyz>

_pkgname='Insomnia-Designer'
pkgname="${_pkgname,,}-bin"
pkgver=2020.4.1
pkgrel=1
pkgdesc='Collaborative API Design Tool for designing, testing and managing OpenAPI specifications'
arch=('x86_64')
url='https://insomnia.rest'
_url_source='https://github.com/Kong/insomnia'
license=('MIT')
depends=('libappindicator-gtk3' 'libnotify' 'libsecret' 'libxss' 'libxslt' 'nodejs' 'nss' 'xdg-utils')
provides=("${_pkgname,,}")
conflicts=("${_pkgname,,}")
source=("${_url_source}/releases/download/designer@${pkgver}/${_pkgname/-/.}-${pkgver}.deb"
        "${_pkgname}-${pkgver}-LICENSE::${_url_source}/raw/master/LICENSE")
# NB: updpkgsums: LICENSE == SKIP
sha256sums=('07abf18fbe6fa20b9b710dee9f0a770dd4c8920c7af386e1e856193b22cd4a1a'
            'SKIP')

package() {
  tar -xvf data.tar.xz -C "${pkgdir}"
  rm -rf "${pkgdir}/usr/share/doc"
  install -d "${pkgdir}/usr/bin"
  ln -sf "/opt/${_pkgname/-/ }/${_pkgname,,}" "${pkgdir}/usr/bin/${_pkgname,,}"
  install -Dm644 -t "${pkgdir}/usr/share/licenses/${_pkgname}" \
    "${pkgdir}/opt/${_pkgname/-/ }/"{'LICENSE.electron.txt','LICENSES.chromium.html'}
  install -Dm644 "${_pkgname}-${pkgver}-LICENSE" "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
}

# vim: ts=2 sw=2 et:
