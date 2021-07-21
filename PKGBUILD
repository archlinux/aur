# Maintainer: Richard Hillmann <richie at project0 dot de>
pkgname=awsvpnclient
pkgver=1.0.0
pkgrel=4
pkgdesc="AWS VPN Client"
arch=('x86_64')
license=('custom')
url='https://aws.amazon.com/vpn/'
source=(
  "https://d20adtppz83p9s.cloudfront.net/GTK/${pkgver}/awsvpnclient_amd64.deb"
  'awsvpnclient.desktop.patch'
)
sha512sums=(
  '07cf41a23b983a98e15719e37d52ce58ad10c0300a8fee03563a6c66b5992b6f148f8075b564f7b254ff230c9772ff692fc248aec45749e11d6b7d076befd880'
  'SKIP'
)
depends=('xdg-utils' 'lsof')
makedepends=('xz')
options=('!strip' 'staticlibs')
install='awsvpnclient.install'

package(){
  tar -xf "${srcdir}/data.tar.xz" -C "${pkgdir}"

  # Apply patch to fix desktop file for KDE
  patch -s "${pkgdir}/usr/share/applications/awsvpnclient.desktop" "${srcdir}/awsvpnclient.desktop.patch"

  # Permission fix
  find "${pkgdir}" -type d -exec chmod 755 {} +

  # License
  install -Dm644 "${pkgdir}/opt/awsvpnclient/Resources/LINUX-LICENSE.txt" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm644 "${pkgdir}/usr/share/doc/awsvpnclient/copyright" "${pkgdir}/usr/share/licenses/${pkgname}/copyright"
}