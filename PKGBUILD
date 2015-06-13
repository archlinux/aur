# Maintainer: Alexis Letessier <alexis.letessier@gmail.com>

pkgname=gerty-git
pkgver=e9db8d7
pkgrel=3
pkgdesc="Automation tool for network operation tasks"
depends=('perl-expect' 'perl-net-snmp' 'perl' 'perl-xml-libxml' 'perl-config-any')
makedepends=('git' 'pandoc')
conflicts=('gerty')
provides=('gerty')
arch=('any')
url="https://github.com/ssinaygin/gerty"
license=('GPL2')
source=("git+https://github.com/ssinyagin/gerty.git")
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/${pkgname/-git/}"
  git rev-parse --short origin/master
}

build() {
  cd "$srcdir/${pkgname/-git/}"
  autoreconf
  ./configure --prefix=/usr
  make
  pandoc -s doc/gerty_manpage.markdown -t man | gzip -c > doc/gerty.1.gz
}

package() {
  cd "$srcdir/${pkgname/-git/}"
  make DESTDIR="$pkgdir/" install
  install -D -m644 doc/gerty.1.gz "$pkgdir/usr/share/man/man1/gerty.1.gz"
}

# vim:set ts=2 sw=2 et:
