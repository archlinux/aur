# Maintainer: Rod Kay     <rodakay5 at gmail.com>

pkgname=parse_args
pkgver=0.9.0
pkgrel=1
pkgdesc="An Ada 2012 package that provides simple command-line argument parsing."

arch=(i686 x86_64)
url=https://github.com/jhumphry/parse_args
license=(ISC)

makedepends=(gcc-ada)

source=(https://github.com/jhumphry/parse_args/archive/refs/heads/master.zip
        parse_args.gpr.patch)

sha256sums=(7177d01d2ad43534b7d78d1b3c7def69bfd625d17637a84fdefe06d52e54545c
            c9fb6cbcf1547b9c5af59e04e1f6a63a36292ec2340a9028cd04d1d3419669af)

prepare()
{
  cd $srcdir/parse_args-master

  patch -Np0 -i ../parse_args.gpr.patch
}


build() 
{
  cd $srcdir/parse_args-master

  gprbuild -P parse_args.gpr
}


package() 
{
  cd $srcdir/parse_args-master

  gprinstall --prefix="$pkgdir/usr"   \
             --create-missing-dirs    \
              -P parse_args.gpr

  # Install the license.
  #
  install -D -m644     \
     "LICENSE"         \
     "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}