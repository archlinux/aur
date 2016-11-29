#Maintainer: Bhoppi Chaw <bhoppi#outlook,com>

pkgname=fdk-aac-enc
pkgver=0.1.4
pkgrel=3
pkgdesc='AAC encoder frontend for FDK-AAC library'
arch=(x86_64 i686)
url='http://sourceforge.net/projects/opencore-amr/'
depends=("libfdk-aac>=$pkgver")
license=(custom)
source=("http://downloads.sourceforge.net/opencore-amr/fdk-aac-$pkgver.tar.gz")
sha256sums=('5910fe788677ca13532e3f47b7afaa01d72334d46a2d5e1d1f080f1173ff15ab')

build()
{
    cd fdk-aac-$pkgver
    sed -i '/#include/s|libAACenc/include|fdk-aac|' aac-enc.c
    gcc -s $CPPFLAGS $CFLAGS $LDFLAGS -o aac-enc aac-enc.c wavreader.c -lfdk-aac
}

package()
{
    cd fdk-aac-$pkgver
    install -D -m755 './aac-enc' "$pkgdir/usr/bin/aac-enc"
    install -d -m755 "$pkgdir/usr/share/licenses/" && cd "$pkgdir/usr/share/licenses/"
    ln -s libfdk-aac $pkgname
}
