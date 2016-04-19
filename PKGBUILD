# Maintainer: Kelly Prescott <kprescott@coolip.net>
# Contributor: Chris Brannon <chris@the-brannons.com>
# Contributor: Jan de Groot <jgc@archlinux.org>
# Contributor: Giovanni Scafora <giovanni@archlinux.org>

pkgname=brltty-minimal
pkgver=5.3.1
pkgrel=1
pkgdesc="Braille display driver for Linux/Unix"
arch=(i686 x86_64)
url="http://brltty.com"
license=(GPL LGPL)
depends=(bash icu)
conflicts=('brltty')
provides=('brltty')
backup=(etc/brltty.conf)
options=('!emptydirs')
install=brltty.install
source=(http://brltty.com/archive/brltty-$pkgver.tar.xz
        brltty.service)

build() {
  cd "${srcdir}/brltty-${pkgver}"
  ./configure --prefix=/usr --sysconfdir=/etc --localstatedir=/var \
    --mandir=/usr/share/man \
    --with-tables-directory=/usr/share/brltty \
    --with-screen-driver=lx \
    --disable-speech-support \
    --disable-gpm \
    --disable-java-bindings \
    --disable-python-bindings \
    --disable-tcl-bindings \
    --disable-ocaml-bindings \
    --disable-x \
    --disable-lisp-bindings \
    --disable-standalone-programs

  make
}

package() {
  cd "${srcdir}/brltty-${pkgver}"
  make INSTALL_ROOT="$pkgdir" install
  install -Dm644 Documents/brltty.conf "$pkgdir/etc/brltty.conf"
  install -Dm644 ../brltty.service "$pkgdir/usr/lib/systemd/system/brltty.service"
}
md5sums=('7835871c911effd286040225bf5355f8'
         '0cad54bb5470122535f5e3a11d5ca123')
