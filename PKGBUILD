# Submitter: neo.shadowsocks<neo.shadowsocks AT gmx.com>
# Maintainer: Kars Wang <jaklsy g-mail>

pkgname=lantern
pkgver=2.0.10
pkgrel=1
pkgdesc='Lantern is a free desktop application that delivers fast, reliable and secure access to the open Internet. (Stable Channel)'
arch=('i686' 'x86_64')
url='https://getlantern.org'
license=('Apache')

# neo: I got it by ldd the lantern-binary as deb metadata doesn't provides it,
# and remove duplicated, like atk required by gtk3
depends=('hicolor-icon-theme' 'bzip2' 'dbus' 'glib2' 'gtk3' 'libappindicator-gtk3' 'mesa' 'xcb-util' 'xdg-utils' 'zlib')
options=('!emptydirs' '!strip' '!docs')
install=$pkgname.install
source=('lantern.service')
source_i686=('lantern-installer-32-bit.deb::https://raw.githubusercontent.com/getlantern/lantern-binaries/master/lantern-installer-32-bit.deb')
source_x86_64=('lantern-installer-64-bit.deb::https://raw.githubusercontent.com/getlantern/lantern-binaries/master/lantern-installer-64-bit.deb')
sha1sums=('da705ba2fa3608a17258009b933e8bb58b3172a2')
sha1sums_i686=('cace8d813aa4148ab7a5729c377b5c10fd8290b9')
sha1sums_x86_64=('e7631e744d4e3b27703a3563d670063fe38852f7')

package() {
    msg2 'Extracting the data.tar.xz...'
    bsdtar -xf data.tar.xz -C "${pkgdir}/"

    msg2 'Install systemd service file...'
    install -Dm644 "${srcdir}/lantern.service" "${pkgdir}/usr/lib/systemd/user/lantern.service"
}
