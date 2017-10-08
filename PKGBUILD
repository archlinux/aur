# Maintainer: Swift Geek
pkgname=rootsh
pkgver=1.5.3
pkgrel=1
pkgdesc="wrapper for shells which logs all echoed keystrokes and terminal output to a file and/or to syslog"
arch=('i686' 'x86_64' 'armv7h' 'armv6h')
url="https://sourceforge.net/projects/rootsh/"
license=('GPL2')
depends=('glibc')
source=("https://download.sourceforge.net/rootsh/$pkgname-$pkgver.tar.gz" 'rootsh-1.5.3-open-needs-3-args.patch')
sha256sums=('7ad043c8cbb02743b5066822bd2aa1b3313d2675d235edea1db287e7138611ec'
            '03e3675bfa6dbc817d36f6d131131e7cc0195c19f26cf7b528db01e4194f731b')

prepare() {
  cd "$srcdir/${pkgname}-${pkgver}"
  patch -Np1 -i "${srcdir}/rootsh-1.5.3-open-needs-3-args.patch"
}

build() {
  cd "$srcdir/${pkgname}-${pkgver}"
  ./configure --prefix=/usr --mandir=/usr/share/man
  make
}

package() {
  cd "$srcdir/${pkgname}-${pkgver}"
  make DESTDIR="${pkgdir}" install
}
