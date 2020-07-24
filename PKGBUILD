# Maintainer: tioguda <tioguda@gmail.com>
# Contributor: Rafael Fontenlle <rafaelff@gnome.org>

pkgname=warsaw-bin
pkgver=1.15.1.1
pkgrel=1
pkgdesc="Banking security tool developed by GAS Tecnologia"
arch=(i686 x86_64)
url="https://www.dieboldnixdorf.com.br/warsaw"
license=('custom')
depends=('at-spi2-core' 'dbus' 'desktop-file-utils' 'gdk-pixbuf2' 'glib2' 'glibc' 'gtk2' 'hicolor-icon-theme' 'libx11' 'libxi' 'procps-ng' 'zenity' 'zlib')
optdepends=('python-gpgme')
backup=('etc/init.d/warsaw' 'etc/init/warsaw.conf')
options=('!strip' '!emptydirs')
install=${pkgname}.install
conflicts=('warsaw')
provides=('warsaw')
source_i686=(https://cloud.gastecnologia.com.br/gas/diagnostico/warsaw_setup_32.deb)
source_x86_64=(https://cloud.gastecnologia.com.br/gas/diagnostico/warsaw_setup_64.deb)
sha256sums_i686=('ee197dcfa674c27478ce42db69d8a3a7a459147f39430756875db9ac2943f3f5')
sha256sums_x86_64=('4e7bf4edcfe1775db18590ad4e810707e68dfbd251448f5cb8c4c7bf464b590c')

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
