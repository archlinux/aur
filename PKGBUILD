# Maintainer: Thor K. H. <thor alfakrøll roht dott no>
# Contributor: Tim Besard <tim $dot$ besard $at$ gmail $dot$ com>
# Contributor: Jelle van der Waa <jellevdwaa @ gmail.com>
# Contributor: Pieter Kokx <pieter $at$ kokx $dot$ .nl>

pkgname=whatpulse
pkgver=2.6.1
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
sha256sums=('9ad42960f0a8b538f1d98fea1ced9b2a97ef59aadca50d0382efdb71434572b7')
source_i686=("http://www.whatpulse.org/files/whatpulse-linux-32bit-$pkgver.tar.gz")
sha256sums_i686=('4961fc8360ef924538c1b74f86dfe5ee3a13b474d9bb6421b4312aa465afa74a')
source_x86_64=("http://www.whatpulse.org/files/whatpulse-linux-64bit-$pkgver.tar.gz")
sha256sums_x86_64=('7ac2fb2a79c789c6de9ad8aab72538c1be540de1b5c49fa0128425b793c0884c')

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
