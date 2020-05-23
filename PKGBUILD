# Maintainer: AwesomeHaircut <jesusbalbastro at gmail com>
# Maintainer: Mateusz Gozdek <mgozdekof@gmail.com>
# Contributor: Rein Fernhout <public@reinfernhout.xyz>
# Past Contributor: James An <james@jamesan.ca>

pkgname=droidcam
_pkgver=6c7b273bd20b23a5b1074d5af30f0a13ce3d6065
pkgver=6.7.5.6c7b273
pkgrel=1
pkgdesc='A tool for using your android device as a wireless/usb webcam'
arch=('x86_64')
url="https://www.dev47apps.com/${pkgname}/linuxx"
license=('GPL')
depends=('v4l2loopback-dc-dkms')
optdepends=('gtk2: use GUI version in addition to CLI interface' )

source=("${pkgname}.desktop"
        "0001-Use-shared-version-of-libjpeg-turbo.patch"
        "droidcam.zip::https://github.com/aramg/${pkgname}/archive/${_pkgver}.zip"
)

sha512sums=('72d21aa2d7eecc9bb070aaf7059a671246feb22f9c39b934a5463a4839f9347050de00754e5031dbc44f78eb2731f58f0cd2fcf781bc241f6fbd1abb4308b7ee'
            '238f41f5a3188226246e6446b3f8eceaf36472c0fb51dac995d535cf66cab27d9c43612fdfd553c57a398804db6ce817ecfaf2360ffbb53a404a05b6ac41a6bb'
            '0bc9d1223fe598f90cb537f9978bf35410248b366e0e3a9ea4815fbcb5a99e8fed8fe00833dacb678f3f125f7614e011276ae3835f91e50f78da87131bd381b8')

prepare() {
  cd "${pkgname}-${_pkgver}"
  patch -p1 --input="${srcdir}/0001-Use-shared-version-of-libjpeg-turbo.patch"
}

build() {
  cd ${pkgname}-${_pkgver}/linux

  make
}

package() {
  cd ${pkgname}-${_pkgver}/linux

  # Install droidcam program files
  install -Dm755 "${pkgname}" "$pkgdir/usr/bin/${pkgname}"
  install -Dm755 "${pkgname}-cli" "$pkgdir/usr/bin/${pkgname}-cli"
  install -Dm644 icon2.png "$pkgdir/usr/share/pixmaps/${pkgname}.png"
  install -Dm644 "../../${pkgname}.desktop" "$pkgdir/usr/share/applications/${pkgname}.desktop"
  install -Dm644 README.md "$pkgdir/usr/share/licenses/${pkgname}/LICENSE"
}
