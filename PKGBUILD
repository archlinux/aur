# Maintainer: Caltlgin Stsodaat <contact@fossdaily.xyz>

_pkgname='Insomnia-Designer'
pkgname="${_pkgname,,}-bin"
pkgver=2020.5.1
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
        "${_pkgname}-${pkgver}-license::${_url_source}/raw/designer@${pkgver}/LICENSE")
sha256sums=('ce3e0c19e20b9ff785f25d9da9fe545df70b71f1a3ba80969d8d1b852e269dbd'
            'cc91b5641bbbf592a69ca5f7b45807efba470068e815fc7682a42022bbd3cbb9')

package() {
  tar -xvf 'data.tar.xz' -C "${pkgdir}"
  rm -rf "${pkgdir}/usr/share/doc"
  install -dv "${pkgdir}/usr/bin"
  ln -sfv "/opt/${_pkgname/-/ }/${_pkgname,,}" -t "${pkgdir}/usr/bin"
  install -Dvm644 "${pkgdir}/opt/${_pkgname/-/ }/"{'LICENSE.electron.txt','LICENSES.chromium.html'} \
    -t "${pkgdir}/usr/share/licenses/${_pkgname,,}"
  install -Dvm644 "${_pkgname}-${pkgver}-license" "${pkgdir}/usr/share/licenses/${_pkgname,,}/LICENSE"
}

# vim: ts=2 sw=2 et:
