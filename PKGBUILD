# Maintainer: tioguda <tioguda@gmail.com>
# Contributor: Rafael Fontenlle <rafaelff@gnome.org>

pkgname=warsaw-bin
pkgver=2.20.0.13
pkgrel=2
pkgdesc="Banking security tool developed by GAS Tecnologia"
arch=(i686 x86_64)
url="https://diagnostico.gasantifraud.com"
license=('custom')
depends=('dbus' 'procps-ng' 'python' 'zenity')
optdepends=('gtk2: required on first bank setup'
            'python-gpgme')
backup=('etc/init.d/warsaw' 'etc/init/warsaw.conf')
options=('!strip' '!emptydirs')
install=${pkgname}.install
conflicts=('warsaw')
provides=('warsaw')
source_i686=("warsaw-${pkgver}-32.deb::https://cloud.gastecnologia.com.br/gas/diagnostico/warsaw_setup_32.deb")
source_x86_64=("warsaw-${pkgver}-64.deb::https://cloud.gastecnologia.com.br/gas/diagnostico/warsaw_setup_64.deb")
sha256sums_i686=('4d3663f73d9ca714be1010fee2f7ae65e8e438849b86903a3c8cd1975504389e')
sha256sums_x86_64=('2e5f89a1ce80ca9ec41f1f3d7e135e82921cbdab7550a122747a561faba54212')

prepare() {
    tar -xJf data.tar.xz
}

package() {
    cd "$srcdir"
    # dump etc files to /etc
    cp -r etc "$pkgdir"
    # dump usr files to /usr
    cp -r usr "$pkgdir"
    # dump lib files to /lib
    cp -r lib "$pkgdir/usr/"
  
    # Install copyright and license in proper directory
    install -Dm644 "$pkgdir"/usr/share/{doc,licenses}/warsaw/copyright
    rm -rf "$pkgdir/usr/share/doc"
}
