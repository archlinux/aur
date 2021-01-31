# Maintainer: Alberto Redondo <albertomost at gmail dot com>
# Contributor: Caltlgin Stsodaat <contact@fossdaily.xyz>
# Contributor: Piotr Górski <lucjan.lucjanov@gmail.com>

_pkgname=papirus-folders
pkgname=papirus-folders-please
pkgver=1.8.0
pkgrel=2
pkgdesc='Change Papirus icon theme folder colors'
arch=('any')
url='https://github.com/PapirusDevelopmentTeam/papirus-folders'
license=('MIT')
depends=('papirus-icon-theme' 'please')
provides=('papirus-folders')
conflicts=('papirus-folders' 'papirus-folders-doas')
source=("${_pkgname}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz"
        "${_pkgname}.hook"
        "please.diff")
sha256sums=('a60d0d432ea9b7c98b74a607301bdc4e26b3b48a3b9bc6054ffb7d64f8dcf9c5'
            '5c48cde4ad155e357857f56ec2ce4d26d3e3fdd12b141e349640775481539ed9'
            '982af8f929ad4026fafd5c72fa7e190f100064b2ab1cab61090de8062f5973e1')

prepare() {
  cd "${_pkgname}-${pkgver}"
  patch -p1 -i ${srcdir}/please.diff
}

build() {

  make -C "${_pkgname}-${pkgver}"
}

package() {

  make DESTDIR="${pkgdir}" -C "${_pkgname}-${pkgver}" install

  install -Dm644 "${_pkgname}.hook" \
    -t "${pkgdir}/usr/share/libalpm/hooks"
  install -Dm644 "${_pkgname}-${pkgver}/README.md" \
    -t "${pkgdir}/usr/share/doc/${pkgname}"
  install -Dm644 "${_pkgname}-${pkgver}/LICENSE" \
    -t "${pkgdir}/usr/share/licenses/${pkgname}"

}
