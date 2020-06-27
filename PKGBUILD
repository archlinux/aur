# Maintainer : darkgeem <darkgeem [at] pyrokinesis [dot] fr>
# Contributor: darkgeem <darkgeem [at] pyrokinesis [dot] fr>
# Contributor: JulioJu  < juanes  0890  at google mail dot com >
# Contributor: Maks Verver <maksverver at geocities dot com>

pkgname=uml_utilities-fixed
pkgver=20070815
pkgrel=1
pkgdesc="User Mode Linux Utilities (Debian package uml-utilities). It contains uml_net, uml_mconsole, uml_switch, tunctl, … and the lib port-helper."
arch=(i686 x86_64)
depends=('fuse' 'readline')
# Damn! You can't leave empty lines there for years!
provides=('uml_utilities')
conflicts=('uml_utilities')
url="http://user-mode-linux.sourceforge.net/"
source=(
    "http://user-mode-linux.sourceforge.net/${pkgname}_${pkgver}.tar.bz2"
    "uml_utilities.patch")
license=('GPL2')
md5sums=(
    'b0468ac8b79cef53f36f5f9517907462'
    '8fbcca01953da90c48f5ec06f564480f')

prepare() {
  cd "$srcdir/tools-$pkgver"
  patch -Np1 -i "${srcdir}/uml_utilities.patch"
}

build() {
  cd "$srcdir/tools-$pkgver"
  make
}

package() {
  cd "$srcdir/tools-$pkgver"
  make DESTDIR="$pkgdir" install
  mv "$pkgdir/usr/sbin/"* "$pkgdir/usr/bin/" && rmdir "$pkgdir/usr/sbin/" || return 4
  chown root "$pkgdir/usr/bin/"*
}
