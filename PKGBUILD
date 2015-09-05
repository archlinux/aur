# Maintainer: Thor K. H. <thor alfakrøll roht dott no>
# Contributor: Tim Besard <tim $dot$ besard $at$ gmail $dot$ com>
# Contributor: Jelle van der Waa <jellevdwaa @ gmail.com>
# Contributor: Pieter Kokx <pieter $at$ kokx $dot$ .nl>

pkgname=whatpulse
pkgver=2.6.3
pkgrel=1
pkgdesc="Measures your keyboard, mouse and application usage, network traffic and uptime."
arch=('i686' 'x86_64')
url=http://www.whatpulse.org
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
sha256sums_i686=('cb21df5785686530c8c029af90e9fc2c81a776424f51d4a8ee8be2cc4c2f6fde')
sha256sums_x86_64=('1268bb51e697f2f76938401953f421c50fb295cb5de77116d4ccbe84e099f047')

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
