# Contributor: Jens Staal <staal1978@gmail.com>
# Contributor: Sascha Biermmanns <saschakb at gmail dot com>
# Contributor: Osmiy
# Contributor: lavandero
# Maintainer: aksr <aksr at t-com dot me>
pkgname=heirloom-devtools-cvs
pkgver=2011.06.22
pkgrel=1
arch=('i686' 'x86_64')
pkgdesc="The Heirloom Development tools (yacc, lex, make ...) derived from original UNIX tools"
url="http://heirloom.sourceforge.net/devtools.html"
license=('custom:"caldera"' 'custom:"opensolaris"')
depends=('heirloom-sh-cvs')
makedepends=('cvs')
source=('000-config.diff' '001-lock.patch')
md5sums=('2585f68fb07fef84cfd4bacbe2bbc1ab'
         '1edde6c9e667e9ee602e237acf1f9dc5')
sha1sums=('96cceac73851c7710e204038414f169bd08fe5a4'
          '4c8a2225da05dfb4d490293bfb9d36a7ab02e17c')
sha256sums=('10cca6399d5759712bedef02af0c49a2d6ce476f0bf075613b00d2c519ed8cae'
            'b80c959dec91a5ff56ac86352ce6cc744b454a27ad3d6ba93e2917944803264b')

prepare() {
  cvs -d:pserver:anonymous:@heirloom.cvs.sourceforge.net:/cvsroot/heirloom login
  cvs -d:pserver:anonymous:@heirloom.cvs.sourceforge.net:/cvsroot/heirloom co -P heirloom-devtools
  rm -rf $srcdir/build
  cp -ar $srcdir/heirloom-devtools $srcdir/build
  cd $srcdir/build
  patch -p1 < ../000-config.diff
  #patch -p0 < ../001-lock.patch # patch does not apply. Probably only needed for stable version.
}

build() {
  cd $srcdir/build
  make
}

package() {
  cd $srcdir/build
  make install ROOT="$pkgdir"
  mkdir -p $pkgdir/usr/share/licenses/$pkgname/
  install -m644 LICENSE/BERKELEY.LICENSE $pkgdir/usr/share/licenses/$pkgname/BERKELEY
  install -m644 LICENSE/CALDERA.LICENSE $pkgdir/usr/share/licenses/$pkgname/CALDERA
}

