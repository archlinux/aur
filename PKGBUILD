# Maintainer: Thor K. H. <thor alfakrøll roht dott no>
# Contributor: Tim Besard <tim $dot$ besard $at$ gmail $dot$ com>
# Contributor: Jelle van der Waa <jellevdwaa @ gmail.com>
# Contributor: Pieter Kokx <pieter $at$ kokx $dot$ .nl>

pkgname=whatpulse
pkgver=2.7
pkgrel=1
pkgdesc="Measures your keyboard, mouse and application usage, network traffic and uptime."
arch=('i686' 'x86_64')
url=http://www.whatpulse.org
# I have yet to find the actual licence, but alternatively: it's basically freeware
license=(custom:whatpulse_tos)
install="$pkgname.install"
depends=(qt4)
optdepends=(
    'systray: any systray, like gnome-panel'
    'libpcap: for capturing network statistics'
)
source=('whatpulse.desktop')
source_i686=("http://static.whatpulse.org/files/whatpulse-linux-32bit-$pkgver.tar.gz")
source_x86_64=("http://static.whatpulse.org/files/whatpulse-linux-64bit-$pkgver.tar.gz")
sha256sums=('9ad42960f0a8b538f1d98fea1ced9b2a97ef59aadca50d0382efdb71434572b7')
sha256sums_i686=('aa47fcb6a4f71fdc492c2a8e489d51fa1bb5d873d01423cd6600b5ac371a793d')
sha256sums_x86_64=('12a469da60561e3fa920703b2326dff2475a443c7c99eee6ee62b69f2a57f01a')

package() {
    cd $srcdir/
    # Install the binary
    mkdir -p ${pkgdir}/usr/bin
    install -m0755 whatpulse ${pkgdir}/usr/bin/
    # Install the freedesktop shortcut
    mkdir -p ${pkgdir}/usr/share/applications
    install -m0644 whatpulse.desktop ${pkgdir}/usr/share/applications/
    
    mkdir -p ${pkgdir}/etc/udev/rules.d/
    cat >${pkgdir}/etc/udev/rules.d/99-whatpulse-input.rules <<__EOF__
KERNEL=="event*", NAME="input/%k", MODE="640", GROUP="input"
__EOF__
}
