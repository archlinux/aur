#Maintainer: Bhoppi Chaw <bhoppi#outlook,com>

pkgname=fdk-aac-enc
pkgver=2.0.1
pkgrel=1
pkgdesc='AAC encoder frontend for FDK-AAC library'
arch=(x86_64)
url='https://sourceforge.net/projects/opencore-amr/'
depends=("libfdk-aac>=$pkgver")
license=(custom)
source=("https://downloads.sourceforge.net/opencore-amr/fdk-aac-$pkgver.tar.gz")
sha256sums=('840133aa9412153894af03b27b03dde1188772442c316a4ce2a24ed70093f271')

build() {
    cd fdk-aac-$pkgver
    sed -i '/#include/s|libAACenc/include|fdk-aac|' aac-enc.c
    gcc -s $CPPFLAGS $CFLAGS $LDFLAGS -o aac-enc aac-enc.c wavreader.c -lfdk-aac
}

package() {
    cd fdk-aac-$pkgver
    install -D -m755 './aac-enc' "$pkgdir/usr/bin/aac-enc"
    install -d -m755 "$pkgdir/usr/share/licenses/" && cd "$pkgdir/usr/share/licenses/"
    ln -s libfdk-aac $pkgname
}
