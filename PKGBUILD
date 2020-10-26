# Maintainer: Caltlgin Stsodaat <contact@fossdaily.xyz>

_pkgname='Insomnia-Designer'
pkgname="${_pkgname,,}-bin"

pkgver=2020.4.2
pkgrel=1
_commit_license='fa85501efdb0aff74d4fcca4207664711486c430'

pkgdesc='Collaborative API Design Tool for designing, testing and managing OpenAPI specifications'
arch=('x86_64')
url='https://insomnia.rest'
_url_source='https://github.com/Kong/insomnia'
license=('MIT')
depends=('libappindicator-gtk3' 'libnotify' 'libsecret' 'libxss' 'libxslt' 'nodejs' 'nss' 'xdg-utils')
provides=("${_pkgname,,}")
conflicts=("${_pkgname,,}")
source=("${_url_source}/releases/download/designer@${pkgver}/${_pkgname/-/.}-${pkgver}.deb"
        "license-${_commit_license}::${_url_source}/raw/${_commit_license}/LICENSE")
sha256sums=('92d672fcdbd53aa7000449e6a8d296d847fb3de543657e82f4145a1906234ea1'
            'cc91b5641bbbf592a69ca5f7b45807efba470068e815fc7682a42022bbd3cbb9')

package() {
  tar -xvf 'data.tar.xz' -C "${pkgdir}"
  rm -rf "${pkgdir}/usr/share/doc"
  install -dv "${pkgdir}/usr/bin"
  ln -sfv "/opt/${_pkgname/-/ }/${_pkgname,,}" -t "${pkgdir}/usr/bin"
  install -Dvm644 "${pkgdir}/opt/${_pkgname/-/ }/"{'LICENSE.electron.txt','LICENSES.chromium.html'} \
    -t "${pkgdir}/usr/share/licenses/${_pkgname,,}"
  install -Dvm644 "license-${_commit_license}" "${pkgdir}/usr/share/licenses/${_pkgname,,}/LICENSE"
}

# vim: ts=2 sw=2 et:
