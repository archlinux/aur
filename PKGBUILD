# Contributor: Sietse van der Molen <sietse@vdmolen.eu>
# Contributor: Rod Kay              <charlie5 on #ada at freenode.net>

pkgname=florist
pkgver=2015
pkgrel=1
pkgdesc="An open-source implementation of IEEE Standard 1003.5b-1996, the POSIX Ada binding."

arch=('any')
url="http://sourceforge.net/projects/gnat-florist/"
license=('GPL3')

groups=()

depends=('gcc-ada')
makedepends=()
optdepends=()

provides=()
conflicts=()
replaces=()
backup=()

options=(staticlibs)

noextract=()
install=
changelog=

source=(http://downloads.dragonlace.net/src/$pkgname-gpl-$pkgver-src.tar.gz
        'fixlibdir.patch'
        'fixfloristdir.patch')

md5sums=('f46a866308b32c7efcee47230b238d4e'
         '1934106ceeb63ef23c50a5ed38b9b8a2'
         '0c9ef7e75ef15784a6ed8a7b9ee46251')



build() 
{
  cd "$srcdir/$pkgname-gpl-$pkgver-src"

  ./configure --prefix=$pkgdir/usr

  # florist uses weird standard for their directories, lets make it more arch-like
  #patch -p0 -i $srcdir/fixlibdir.patch

  make -j7

  # Because we changed the directory earlier and it's hardcoded in the lib, fix that
  #patch -p0 -R -i $srcdir/fixfloristdir.patch
}



package() 
{
  cd "$srcdir/$pkgname-gpl-$pkgver-src"

  make DESTDIR="$pkgdir/" install
}
