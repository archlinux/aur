# Maintainer: tioguda <tioguda@gmail.com>
# Contributor: Rafael Fontenlle <rafaelff@gnome.org>

pkgname=warsaw-bin
pkgver=2.21.1.13
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
sha256sums_i686=('fb99b8ded9128b89b4bedd4a4cac0f0b19f2e9c712b1b011ab051fc6a0f63eb2')
sha256sums_x86_64=('5dde8c45b477de0e9d05a063f66c5d99122480e17133421a2954b15344a6c942')

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
