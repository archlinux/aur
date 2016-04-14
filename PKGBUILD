# Contributor: Jens Staal <staal1978@gmail.com>
# Contributor: Sascha Biermmanns <saschakb at gmail dot com>
# Contributor: Osmiy
# Contributor: lavandero
# Maintainer: aksr <aksr at t-com dot me>
pkgname=heirloom-devtools-cvs
pkgver=2011.06.22
pkgrel=2
arch=('i686' 'x86_64')
pkgdesc="The Heirloom Development tools (yacc, lex, make ...) derived from original UNIX tools."
url="http://heirloom.sourceforge.net/devtools.html"
license=('custom:berkeley' 'custom:"caldera"' 'custom:"opensolaris"')
depends=('heirloom-sh-cvs')
makedepends=('cvs')
source=('000-config.diff')
md5sums=('2585f68fb07fef84cfd4bacbe2bbc1ab')
sha1sums=('96cceac73851c7710e204038414f169bd08fe5a4')
sha256sums=('10cca6399d5759712bedef02af0c49a2d6ce476f0bf075613b00d2c519ed8cae')

prepare() {
  cvs -d:pserver:anonymous:@heirloom.cvs.sourceforge.net:/cvsroot/heirloom login
  cvs -d:pserver:anonymous:@heirloom.cvs.sourceforge.net:/cvsroot/heirloom co -P heirloom-devtools
  rm -rf $srcdir/build
  cd "$srcdir/${pkgname%-*}"
  patch -p1 < ../000-config.diff
}

build() {
  cd "$srcdir/${pkgname%-*}"
  make
}

package() {
  cd "$srcdir/${pkgname%-*}"
  make install ROOT="$pkgdir"
  cd "LICENSE/"
  for i in *.LICENSE; do
    install -Dm0644 $i $pkgdir/usr/share/licenses/${pkgname%-*}/$i
  done
}

