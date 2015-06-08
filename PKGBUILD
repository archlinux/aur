# Maintainer: Philipp 'TamCore' B. <philipp {at} tamcore {dot} eu>
# Contributor: Sébastien Luttringer <seblu@aur.archlinux.org>
# Contributor: Lex Rivera aka x-demon <aur@x-demon.org>

pkgname=gobi-loader
pkgver=0.7
pkgrel=5
pkgdesc='Loader for gobi wwan chipset firmware'
source=("http://www.codon.org.uk/~mjg59/gobi_loader/download/gobi_loader-${pkgver}.tar.gz")
url='http://www.codon.org.uk/~mjg59/gobi_loader'
arch=('i686' 'x86_64')
license=('GPL2')

sha256sums=('78bdc255451cde1caa406e146b01a88828480c9c43272de8cffdb61627be754a')

build() {
  cd gobi_loader-$pkgver
  # fix firmware path
  sed -ri 's#/lib/#/usr/lib/#' 60-gobi.rules
  gcc $CFLAGS $LDFLAGS gobi_loader.c -o gobi_loader
}

package() {
  cd gobi_loader-$pkgver
  install -D -m744 gobi_loader "$pkgdir/usr/lib/udev/gobi_loader"
  install -D -m644 60-gobi.rules "$pkgdir/usr/lib/udev/rules.d/60-gobi.rules"
}

# vim:set ts=2 sw=2 ft=sh et:
