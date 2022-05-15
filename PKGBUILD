# Maintainer: Rod Kay <rodakay5 at gmail.com>

pkgname=florist
pkgver=2022
pkgrel=1
pkgdesc="An open-source implementation of IEEE Standard 1003.5b-1996, the POSIX Ada binding."

arch=('i686' 'x86_64')
url="https://github.com/AdaCore/florist"
license=('GPL3')

depends=('gcc-ada')
options=(staticlibs !strip)

source=(https://github.com/AdaCore/florist/archive/refs/tags/v22.0.0.tar.gz
        posix-signals.ads-patch
        posix-unsafe_process_primitives.ads-patch)
sha256sums=(534eb65f01c4b89b366e1251ec1c13a03482574e580f08107f1ed8ad1994bc67
            85823c4d2453ce4f5b73dd64beb0297d38e4a0525d06fbbb697d405533864297
            48975e3b4c5e22d514df28951c62db9851b8799f874e36f1762c0d84b69261e3)


prepare()
{
   cd "$srcdir/florist-22.0.0"

   patch -p0 -i ../posix-signals.ads-patch
   patch -p0 -i ../posix-unsafe_process_primitives.ads-patch
}


build() 
{
   cd "$srcdir/florist-22.0.0"

   ./configure --prefix=$pkgdir/usr --with-build-type=Production
   PROCESSORS="$(nproc)" make
}


package() 
{
   cd "$srcdir/florist-22.0.0"

   make DESTDIR="$pkgdir/" install
}