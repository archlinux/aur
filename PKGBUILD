# Maintainer: tioguda <tioguda@gmail.com>
# Contributor: Rafael Fontenlle <rafaelff@gnome.org>

pkgname=warsaw-bin
pkgver=1.13.1.2
pkgrel=3
pkgdesc="Banking security tool developed by GAS Tecnologia"
arch=(i686 x86_64)
url="https://www.dieboldnixdorf.com.br/warsaw"
license=('custom')
depends=('procps-ng' 'python2' 'python2-mini-amf' 'python2-unicodecsv' 'python2-pyopenssl' 'openssl' 'nss' 'zenity' 'gdk-pixbuf2' 'pango' 'glib2' 'libx11' 'libstdc++296-bin' 'zlib')
optdepends=('gtk2: required on first bank setup')
backup=('etc/init.d/warsaw' 'etc/init/warsaw.conf' 'etc/xdg/autostart/warsaw.desktop')
options=('!strip')
install=${pkgname}.install
conflicts=('warsaw')
provides=('warsaw')
source=('fix.patch')
source_i686=(https://cloud.gastecnologia.com.br/gas/diagnostico/warsaw_setup_32.deb)
source_x86_64=(https://cloud.gastecnologia.com.br/gas/diagnostico/warsaw_setup_64.deb)
sha256sums=('cf2389806c92ac87d7775522d6dbc7de63a52f780dbe2b8e40a6e248709414a5')
sha256sums_i686=('a6f6ec95ccd023aef66f8a80c8695bfe8713a68435b3e277b9e5a6b3b0c818af')
sha256sums_x86_64=('6b99554976c12f6290c4eef97895e36bc980011703ddfbade5ff8cf825d25e58')

prepare() {
    tar -xJf data.tar.xz
    patch -p1 -i ./fix.patch
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
