# Maintainer: Jens Staal <staal1978 at gmail dot com>
# Contributor: Sascha Biermmanns <saschakb at gmail dot com>
# Contributor: Daniel Leidisch <spam@leidisch.net>
# Updated by: Jens Staal <staal1978@gmail.com>
# Maintainer: aksr <aksr at t-com dot me>
pkgname=heirloom-sh-cvs
pkgver=2011.06.22
pkgrel=2
pkgdesc="A portable variant of the traditional Unix shell, implements the SVR4/SVID3 level of the shell."
arch=('i686' 'x86_64')
url="http://heirloom.sourceforge.net/sh.html"
license=('custom:"caldera"' 'custom:"opensolaris"')
provides=('sh' 'heirloom-sh')
replaces=('heirloom-sh')
makedepends=('cvs')
conflicts=()
source=('000-config.diff')
md5sums=('991b32bee780ce48685dfd4d39d41443')
sha1sums=('0119962358fce0b5ba88eab750d1ef2d91402428')
sha256sums=('f0452b9fb1c58a6f0fba6d49bcd7598f875c94f64ddd8b60bb8ab12bbbaf7c9b')

prepare() {
  cvs -d:pserver:anonymous:@heirloom.cvs.sourceforge.net:/cvsroot/heirloom login
  cvs -d:pserver:anonymous:@heirloom.cvs.sourceforge.net:/cvsroot/heirloom co -P heirloom-sh
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
  install -Dm644 CALDERA.LICENSE "$pkgdir"/usr/share/licenses/${pkgname%-*}/CALDERA.LICENSE
  install -Dm644 OPENSOLARIS.LICENSE "$pkgdir"/usr/share/licenses/${pkgname%-*}/OPENSOLARIS.LICENSE
}

