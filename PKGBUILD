# Maintainer: Rod Kay   <rodakay5 at gmail dot com>

pkgname=gnatstudio-bin
pkgver=20220512
pkgrel=1
pkgdesc="GNAT Programming Studio for Ada binary"

arch=(i686 x86_64)
url=https://github.com/AdaCore/gnatstudio
license=(GPL3)

depends=("python")
conflicts=("gnat-gps")

source=(https://github.com/AdaCore/gnatstudio/releases/download/gnatstudio-cr-20220512/gnatstudio-23.0w-20220512-x86_64-linux-bin.tar.gz
        libcrypt.so.1)
sha256sums=(788bde77af2affb0797a783e2f158ca230d89858c0e4eb18355abd20e146baa0
            d8bb7a3c2905e37666355b2c4b1c54ae2139c943618421d4e78d104f35722c32)


prepare()
{
    cd $srcdir
    tar -xvzf gnatstudio-23.0w-20220512-x86_64-linux-bin.tar.gz
}


package() 
{
    cd $srcdir/gnatstudio-23.0w-20220512-x86_64-linux-bin

    ./doinstall "$pkgdir/opt/gnatstudio"

    mkdir "$pkgdir/lib"
    cp $srcdir/libcrypt.so.1 $pkgdir/lib/libcrypt.so.1

    # Install the license.
    install -D -m644     \
       "COPYING3"        \
       "$pkgdir/usr/share/licenses/$pkgname/COPYING3"
}