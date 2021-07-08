# Maintainer: Caltlgin Stsodaat <contact@fossdaily.xyz>

_pkgname='insomnia'
pkgname="${_pkgname}-bin"
pkgver=2021.4.1
pkgrel=1
pkgdesc='API Client and Design Platform for GraphQL and REST'
arch=('x86_64')
url='https://insomnia.rest'
_url_source='https://github.com/Kong/insomnia'
license=('MIT')
depends=('libnotify' 'libsecret' 'libxss' 'nss')
optdepends=("libappindicator-gtk3: StatusNotifierItem support"
	    "xdg-utils: open URLs with desktop's default (xdg-email, xdg-open)")
provides=("${_pkgname}")
conflicts=("${_pkgname}")
source=("${_url_source}/releases/download/core@${pkgver}/${_pkgname^}.Core-${pkgver}.deb"
        "${_pkgname}-${pkgver}-license::${_url_source}/raw/core@${pkgver}/LICENSE")
sha256sums=('ef876ee94401d4b7ec9d817db66c78d4a24d9a511554be47d96f98411ef6d056'
            'cc91b5641bbbf592a69ca5f7b45807efba470068e815fc7682a42022bbd3cbb9')

package() {
  tar -xvf 'data.tar.xz' -C "${pkgdir}"
  rm -rf "${pkgdir}/usr/share/doc"
  install -dv "${pkgdir}/usr/bin"
  ln -sfv "/opt/${_pkgname^}/${_pkgname}" -t "${pkgdir}/usr/bin"
  install -Dvm644 "${pkgdir}/opt/${_pkgname^}/"{'LICENSE.electron.txt','LICENSES.chromium.html'} \
    -t "${pkgdir}/usr/share/licenses/${_pkgname}"
  install -Dvm644 "${_pkgname}-${pkgver}-license" "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
}

# vim: ts=2 sw=2 et:
