# Maintainer:  Dimitris Kiziridis <ragouel at outlook dot com>

pkgname=taps.im
pkgver=11.0.2
pkgrel=1
pkgdesc='An advanced instant messanger with Apps for Android, Iphone, Windows, Mac, Linux and Web'
arch=('x86_64')
url='https://taps.im'
license=('custom')
depends=('nss' 'gtk3')
makedepends=('gendesk')
noextract=("${pkgname}-${pkgver}.tgz")
source=("${pkgname}-${pkgver}.tgz::https://taps.im/Taps-Linux-x64.tgz")
sha256sums=('799cbdc229b8662876c7610a65bae24631dd42ac737ea4ff374acdbf76f6703d')

package() {
  install -d "${pkgdir}/opt/taps.im" "${pkgdir}/usr/bin"
  tar xvf "${pkgname}-${pkgver}.tgz" -C "${pkgdir}/opt/taps.im"
  ln -s /opt/taps.im/Taps "${pkgdir}/usr/bin/taps.im"
  install -Dm644 "${pkgdir}/opt/taps.im/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  gendesk -f -n --pkgname "${pkgname}" \
          --pkgdesc "$pkgdesc" \
          --name "Taps" \
          --comment "$pkgdesc" \
          --exec "${pkgname}" \
          --categories 'Network;Application' \
          --icon "${pkgname}"
  install -Dm644 "${pkgname}.desktop" -t "${pkgdir}/usr/share/applications"
}
