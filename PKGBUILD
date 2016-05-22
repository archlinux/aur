# Submitter: neo.shadowsocks<neo.shadowsocks AT gmx.com>
# Maintainer: Kars Wang <jaklsy g-mail>

pkgname=lantern-bin
pkgver=2.2.4
pkgrel=1
pkgdesc='Lantern is a free desktop application that delivers fast, reliable and secure access to the open Internet. (Stable Channel)'
arch=('i686' 'x86_64')
url='https://getlantern.org'
license=('Apache')

# neo: I got it by ldd the lantern-binary as deb metadata doesn't provides it,
# and remove duplicated, like atk required by gtk3
depends=('libappindicator-gtk3' 'xcb-util' 'xdg-utils')
options=('!emptydirs' '!strip' '!docs')
conflicts=('lantern' 'lantern-headless' 'lantern-headless-git')
provides=('lantern')
install=lantern.install
source=('lantern.service')
source_i686=('lantern-installer-32-bit.deb::https://raw.githubusercontent.com/getlantern/lantern-binaries/master/lantern-installer-32-bit.deb')
source_x86_64=('lantern-installer-64-bit.deb::https://raw.githubusercontent.com/getlantern/lantern-binaries/master/lantern-installer-64-bit.deb')
sha1sums=('da705ba2fa3608a17258009b933e8bb58b3172a2')
sha1sums_i686=('7830bae28eeb6582cdd227c9c4b13416f8871543')
sha1sums_x86_64=('90146c3ac91fa5ba7e13b5cd59c489a147d5f963')

package() {
    msg2 'Extracting the data.tar.xz...'
    bsdtar -xf data.tar.xz -C "${pkgdir}/"

    msg2 'Install systemd service file...'
    install -Dm644 "${srcdir}/lantern.service" "${pkgdir}/usr/lib/systemd/user/lantern.service"
}
