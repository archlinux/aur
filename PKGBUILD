# Maintainer: Colin Reeder <vpzomtrrfrt@gmail.com>
pkgname=wunderlistux-bin
pkgver=0.0.8
pkgrel=1
pkgdesc="An electron wrapper for wunderlist made with ❤️ for Linux (specially for elementary OS)"
url="https://github.com/edipox/wunderlistux"
arch=('i686' 'x86_64')

if [[ `uname -m` == x86_64 ]]; then
    ARCH=x64
else
    ARCH=ia32
fi

if [[ $ARCH == x64 ]]; then
    sha256sums=('917e7eba7d0492885253d6827c360cecfc79ad7c5106ed1a5bc5261328c8865f')
else
    sha256sums=('9d603d2bddb4d6a7746d543eb5b4fba51677a91f37d5a89f6568f5a7e7d85b8d')
fi

source=("$url/releases/download/Linux-$pkgver/Wunderlistux-linux-$ARCH.tar.gz")

package() {
    mkdir -p $pkgdir/opt/$pkgname
    mkdir -p $pkgdir/usr/share/applications
    cp -r $srcdir/Wunderlistux-linux-$ARCH/* $pkgdir/opt/$pkgname
    sed "s/path\/to\/Wunderlistux-linux-x64/opt\/$pkgname/g" $srcdir/Wunderlistux-linux-$ARCH/resources/app/wunderlistux.desktop > $pkgdir/usr/share/applications/$pkgname.desktop
}
