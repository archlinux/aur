# Maintainer: tioguda <tioguda@gmail.com>
# Contributor: Rafael Fontenlle <rafaelff@gnome.org>

pkgname=warsaw-bin
pkgver=1.15.5.3
pkgrel=1
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
sha256sums_i686=('813ada55d336e26fef3710f8eb5797cfc34ec03a02a6f135482b1bf60e08b3a2')
sha256sums_x86_64=('eea8f40a349095642e2ead77c3b9bef0bd40adb424e6516c3ff97dd622bbb248')

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
