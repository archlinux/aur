# Maintainer: tioguda <tioguda@gmail.com>
# Contributor: Rafael Fontenlle <rafaelff@gnome.org>

pkgname=warsaw-bin
pkgver=1.14.1.10
pkgrel=1
pkgdesc="Banking security tool developed by GAS Tecnologia"
arch=(i686 x86_64)
url="https://www.dieboldnixdorf.com.br/warsaw"
license=('custom')
depends=('at-spi2-core' 'dbus' 'desktop-file-utils' 'gdk-pixbuf2' 'glib2' 'glibc' 'gtk2' 'hicolor-icon-theme' 'libx11' 'libxi' 'procps-ng' 'zenity' 'zlib')
optdepends=('python-gpgme')
backup=('etc/init.d/warsaw' 'etc/init/warsaw.conf' 'etc/xdg/autostart/warsaw.desktop')
options=('!strip' '!emptydirs')
install=${pkgname}.install
conflicts=('warsaw')
provides=('warsaw')
source=('fix.patch')
source_i686=(https://cloud.gastecnologia.com.br/gas/diagnostico/warsaw_setup_32.deb)
source_x86_64=(https://cloud.gastecnologia.com.br/gas/diagnostico/warsaw_setup_64.deb)
sha256sums=('cf2389806c92ac87d7775522d6dbc7de63a52f780dbe2b8e40a6e248709414a5')
sha256sums_i686=('7ec5cf573aeee5b55ff6eff8315aee92eae6e447f5070bd03619c454994254f1')
sha256sums_x86_64=('729a5ca9c84a09816b7c03be89bfe6fa0706ae020c79dee04064959cc032740f')

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
