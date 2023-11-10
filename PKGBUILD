# Maintainer: Ali Molaei <ali dot molaei at protonmail dot com>
# Contributor: Caltlgin Stsodaat <contact at fossdaily dot xyz>

_pkgname='insomnia'
_upkgname='Insomnia'
pkgname="${_pkgname}-bin"
pkgver=8.4.0
pkgrel=2
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
sha256sums=('cc4e9d1e20c41c8c00bc702687dc4fbb8ecb0a25efdb60972df0124453e6a222'
            '4197d1eeea274289901dc8b68e16f538ceb535ce1ff592f6895c0a7439908ca2')

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
