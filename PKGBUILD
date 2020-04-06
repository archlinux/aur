# Maintainer: Arthorius <Arthcomicando@gmail.com>

pkgname=warsaw-itau
pkgver=1.14.1.10
pkgrel=1
pkgdesc="Guardião Itaú 30 horas, feito com Warsaw"
arch=(i686 x86_64)
url="https://www.itau.com.br/guardiao"
license=('custom')
depends=('at-spi2-core' 'dbus' 'desktop-file-utils' 'gdk-pixbuf2' 'glib2' 'glibc' 'gtk2' 'hicolor-icon-theme' 'libx11' 'libxi' 'procps-ng' 'zenity' 'zlib')
optdepends=('python-gpgme')
backup=('etc/init.d/warsaw' 'etc/init/warsaw.conf' 'etc/xdg/autostart/warsaw.desktop')
options=('!strip' '!emptydirs')
install=${pkgname}.install
conflicts=('warsaw')
provides=('warsaw')
source=('fix.patch')
source_i686=(https://guardiao.itau.com.br/warsaw/warsaw_setup_32.deb)
source_x86_64=(https://guardiao.itau.com.br/warsaw/warsaw_setup_64.deb)
md5sums=('1d9d50e8c543c9f30df7d96959e99e35')
md5sums_i686=('1b643ecec8b8ef305802626c55cf22d8')
md5sums_x86_64=('69ce1891870d6e042e857fb6b57397c1')

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
