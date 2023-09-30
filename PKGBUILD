# Maintainer: Ali Molaei <ali dot molaei at protonmail dot com>
# Contributor: Caltlgin Stsodaat <contact at fossdaily dot xyz>

_pkgname='insomnia'
_upkgname='Insomnia'
pkgname="${_pkgname}-bin"
pkgver=8.1.0
pkgrel=1
epoch=1
pkgdesc='API Client and Design Platform for GraphQL and REST'
arch=('x86_64')
url='https://insomnia.rest'
_url_source='https://github.com/Kong/insomnia'
license=('MIT')
depends=('libxss' 'nss' 'gtk3' 'alsa-lib')
optdepends=("libappindicator-gtk3: StatusNotifierItem support"
	    "xdg-utils: open URLs with desktop's default (xdg-email, xdg-open)")
provides=("${_pkgname}")
conflicts=("${_pkgname}")
source=("${_url_source}/releases/download/core@${pkgver}/${_upkgname}.Core-${pkgver}.deb"
        "${_url_source}/raw/core@${pkgver}/LICENSE")
sha256sums=('8f6090f7e0998c5aeee160dc1da5f9bf6f9132eb1054c64557ca20b42ca8ae12'
            'cc91b5641bbbf592a69ca5f7b45807efba470068e815fc7682a42022bbd3cbb9')

package() {
  tar -xvf 'data.tar.xz' -C "${pkgdir}"
  rm -rf "${pkgdir}/usr/share/doc"
  install -dv "${pkgdir}/usr/bin"
  ln -sfv "/opt/${_upkgname}/${_pkgname}" -t "${pkgdir}/usr/bin"
  install -Dvm644 "${pkgdir}/opt/${_upkgname}/"{'LICENSE.electron.txt','LICENSES.chromium.html'} \
    -t "${pkgdir}/usr/share/licenses/${_pkgname}"
  install -Dvm644 LICENSE "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
}

# vim: ts=2 sw=2 et:
