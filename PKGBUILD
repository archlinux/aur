# Maintainer: Joey Dumont <joey.dumont@gmail.com>
# Contributor: Airon90

_pack=odepkg
pkgname=octave-$_pack
pkgver=0.8.5
pkgrel=1
pkgdesc="A package for solving ordinary differential equations and more."
arch=('i686' 'x86_64')
url="http://octave.sourceforge.net/$_pack/index.html"
license=('GPLv2+')
depends=('octave>=3.2.0')
makedepends=('gcc-fortran')
install=$pkgname.install
source=("http://downloads.sourceforge.net/octave/$_pack-$pkgver.tar.gz")
noextract=("$_pack-$pkgver.tar.gz")
sha512sums=('9dde767687f817648d6a28155c4a2282317f49aa233635117d53eccdac0128f1d893194f48563f82ba354a639c623ed61b90aa4760009a14bc99fbe7f695853e')

build() {
  cd "$srcdir"
  mkdir -p builddir
  echo "pkg build -nodeps builddir odepkg-$pkgver.tar.gz" | octave --silent
}

package() {
  mkdir -p "$pkgdir/usr/share/octave/packages"
  mkdir -p "$pkgdir/usr/lib/octave/packages"
  cp builddir/odepkg-$pkgver.tar.gz $pkgdir/usr/share/octave/odepkg.tar.gz
}
