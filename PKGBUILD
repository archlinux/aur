# Maintainer Carey Minaieva <jedi2light@jedi2light.moe>

pkgname=pocketbook-pro-sdk-linux-libwine
pkgver=12.5
_pkgver=12-5
pkgrel=1
pkgdesc="Pocketbook-Pro SDK for Linux libwine"
url="https://sourceforge.net/projects/pocketbook-free/files/PocketBook_SDK-linux-libwine/12.5/"
license=('custom')
source=(
    "https://netcologne.dl.sourceforge.net/project/pocketbook-free/PocketBook_SDK-linux-libwine/${pkgver}/PBSDK-linux-libwine_${_pkgver}.7z"
    "Makefile"
)
arch=('x86_64')
md5sums=('a3194da74b0ecd7f6791419c81ea55af' 'e7fd3e94cf97b0dcce201417794b4e94')
depends=(zlib freetype2 lib32-freetype2)
optdepends=(
    "cmake: build some pocketbook apps from /usr/share/${pkgname}/sources/"
    "gtk2: use GTK2 in your apps, also required to build some pocketbook apps"
    "bzip2: use bzip2 in your apps, also required to build some pocketbook apps"
    "giflib: use giflib in your apps, also required to build some pocketbook apps"
)
options=('!strip' '!libtool')

package() {
    cd $srcdir/
    mkdir -p $pkgdir/usr/local/pocketbook/bin
    install -m 755 PBSDK-linux-libwine/bin/pbres $pkgdir/usr/local/pocketbook/bin
    mkdir -p $pkgdir/usr/local/pocketbook
    cp -r PBSDK-linux-libwine/ebrmain $pkgdir/usr/local/pocketbook/
    cp -r PBSDK-linux-libwine/images $pkgdir/usr/local/pocketbook/
    mkdir -p $pkgdir/usr/local/pocketbook/include/
    cp -r PBSDK-linux-libwine/include/*.h $pkgdir/usr/local/pocketbook/include/
    mkdir -p $pkgdir/usr/local/pocketbook/lib
    cp -r PBSDK-linux-libwine/lib/libinkview.a $pkgdir/usr/local/pocketbook/lib
    mkdir -p $pkgdir/usr/local/pocketbook/mnt/ext1/system/
    cp -r PBSDK-linux-libwine/mnt/ext1/system/config $pkgdir/usr/local/pocketbook/mnt/ext1/system/
    mkdir -p $pkgdir/usr/local/pocketbook/sources/grays
    cp -r PBSDK-linux-libwine/sources/grays/src/inkdemo.c $pkgdir/usr/local/pocketbook/sources/grays/
    cat Makefile > $pkgdir/usr/local/pocketbook/sources/grays/Makefile
}

#vim: syntax=sh
