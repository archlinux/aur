# Maintainer:  Rod Kay              <rodakay5 at gmail.com>
# Contributor: Sietse van der Molen <sietse@vdmolen.eu>

pkgname=florist
pkgver=2022
pkgrel=2
pkgdesc="An open-source implementation of IEEE Standard 1003.5b-1996, the POSIX Ada binding."

arch=('i686' 'x86_64')
url="https://github.com/Blady-Com/florist"
license=('GPL3')

depends=('gcc-ada')
options=(staticlibs !strip)

source=('git+https://github.com/Blady-Com/florist.git'
         posix-signals.ads-patch
         posix-unsafe_process_primitives.ads-patch)
sha256sums=(SKIP
            85823c4d2453ce4f5b73dd64beb0297d38e4a0525d06fbbb697d405533864297
            48975e3b4c5e22d514df28951c62db9851b8799f874e36f1762c0d84b69261e3)

prepare()
{
  cd "$srcdir/$pkgname"

   patch -p0 -i ../posix-signals.ads-patch
   patch -p0 -i ../posix-unsafe_process_primitives.ads-patch
}


build() 
{
  cd "$srcdir/$pkgname"

  ./configure --prefix=$pkgdir/usr --with-build-type=Production
  PROCESSORS="$(nproc)" make
}


package() 
{
  cd "$srcdir/$pkgname"

  make DESTDIR="$pkgdir/" install
}
