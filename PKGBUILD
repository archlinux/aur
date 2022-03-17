# Maintainer: Alberto Redondo <albertomost at gmail dot com>
# Contributor: Caltlgin Stsodaat <contact@fossdaily.xyz>
# Contributor: Piotr Górski <lucjan.lucjanov@gmail.com>

pkgname=papirus-folders
pkgver=1.12.0
pkgrel=1
pkgdesc='Change Papirus icon theme folder colors'
arch=('any')
url='https://github.com/PapirusDevelopmentTeam/papirus-folders'
license=('MIT')
depends=('papirus-icon-theme')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz"
        "${pkgname}.hook")
sha256sums=('e20df336d909ef320606caed49797418fba54867fc24d6596576cfa55995c337'
            '5c48cde4ad155e357857f56ec2ce4d26d3e3fdd12b141e349640775481539ed9')

build() {
  make -C "${pkgname}-${pkgver}"
}

package() {
  make DESTDIR="${pkgdir}" -C "${pkgname}-${pkgver}" install

  install -Dm644 "${pkgname}.hook" \
    -t "${pkgdir}/usr/share/libalpm/hooks"
  install -Dm644 "${pkgname}-${pkgver}/README.md" \
    -t "${pkgdir}/usr/share/doc/${pkgname}"
  install -Dm644 "${pkgname}-${pkgver}/LICENSE" \
    -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
