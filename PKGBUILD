# Maintainer: Caltlgin Stsodaat <contact@fossdaily.xyz>

_name='AuthPass'
_pkgname="${_name,,}"
pkgname="${_pkgname}-bin"

pkgver=1.7.9
pkgrel=1
_dl_tag=1605
_commit_icon='f3fcce4f71d8026f22b02dd6588105472ebf394e'

pkgdesc='Keepass compatible password manager based on Flutter'
arch=('x86_64')
url='https://authpass.app'
_url_source='https://github.com/authpass/authpass'
license=('GPL3')
depends=('gtk3' 'libsecret')
makedepends=('gendesk')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
noextract=("${_pkgname}-${pkgver}.tar.gz")
source=("${_pkgname}-${pkgver}.tar.gz::${_url_source}/releases/download/v${pkgver}/${_pkgname}-linux-${pkgver}_${_dl_tag}.tar.gz"
        "icon-${_commit_icon}::${_url_source}/raw/${_commit_icon}/_docs/${_pkgname}-logo.svg")
sha256sums=('3e9f71e91c1d955693784d1475668f9951dec8a157920a844eb4e42fd5eac603'
            '1bfe9685c9399976a872bfcafbe19c16b26063530cdc9184570270d52fe7851b')

prepare() {
  gendesk -f -n \
    --pkgname="${_pkgname}" \
    --pkgdesc="${pkgdesc}" \
    --name="${_name}" \
    --comment="${pkgdesc}" \
    --exec="${_pkgname}" \
    --icon="${_pkgname}" \
    --categories='Utility'
}

package() {
  install -Dvm644 "${_pkgname}.desktop" -t "${pkgdir}/usr/share/applications"
  install -dv "${pkgdir}/"{"opt/${_pkgname}",'usr/bin'}
  tar -xvf "${_pkgname}-${pkgver}.tar.gz" --strip-components=1 -C "${pkgdir}/opt/${_pkgname}"
  ln -sfv "/opt/${_pkgname}/${_pkgname}" -t "${pkgdir}/usr/bin"
  install -Dm644 "icon-${_commit_icon}" "${pkgdir}/usr/share/icons/hicolor/scalable/apps/${_pkgname}.svg"
}

# vim: ts=2 sw=2 et:
