# Maintainer: Eric Anderson <ejona86 at gmail dot com>
# Contributor: delmonico <delmonico at gmx dot net>

pkgname=quarry
pkgver=0.3.0.1
pkgrel=2
pkgdesc="A multi-purpose GUI for Go, Amazons, and Othello"
arch=('i686' 'x86_64')
# Originally http://home.gna.org/quarry/ (abandoned)
# Brief developement at https://gitorious.org/quarry/ (dead with gitorious)
url='https://gitorious.org/quarry/quarry/'
license=('GPL')
depends=('librsvg' 'gtk2')
optdepends=('gnugo: play Go against the computer'
            'grhino: play Othello against the computer')
makedepends=('xmlto' 'docbook-xsl')
install='quarry.install'
source=("https://github.com/ejona86/$pkgname/archive/$pkgver.tar.gz"
        'inline.patch')
sha256sums=('b9349d98127aac41a100720d51dbb0a2c3908c6b6ee40bfd2e36f5a296b19d76'
            'ef3a4760905cf68f467febd55aefbb143da58c1c2f1f5ece7e7512489396710b')

prepare() {
  cd $pkgname-$pkgver/
  patch -p1 < "$srcdir/inline.patch"
}

build() {
  cd $pkgname-$pkgver/
  ./configure --prefix=/usr
  make
  make html
}

package() {
  cd $pkgname-$pkgver/
  make DESTDIR="$pkgdir" install
}
