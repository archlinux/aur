# Maintainer: Alberto Redondo <albertomost at gmail dot com>
# Contributor: Caltlgin Stsodaat <contact@fossdaily.xyz>
# Contributor: Piotr Górski <lucjan.lucjanov@gmail.com>

_pkgname=papirus-folders
pkgname=papirus-folders-doas
pkgver=1.8.0
pkgrel=2
pkgdesc='Change Papirus icon theme folder colors'
arch=('any')
url='https://github.com/PapirusDevelopmentTeam/papirus-folders'
license=('MIT')
depends=('papirus-icon-theme' 'opendoas')
provides=('papirus-folders')
conflicts=('papirus-folders')
source=("${_pkgname}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz"
        "${_pkgname}.hook"
        "doas.diff")
sha256sums=('a60d0d432ea9b7c98b74a607301bdc4e26b3b48a3b9bc6054ffb7d64f8dcf9c5'
            '5c48cde4ad155e357857f56ec2ce4d26d3e3fdd12b141e349640775481539ed9'
            'ccc9500ff84ef2f6452af041af33e2b43ec4976a8a6a84e344228759b430a6f3')

prepare() {
  cd "${_pkgname}-${pkgver}"
  patch -p1 -i ${srcdir}/doas.diff
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
