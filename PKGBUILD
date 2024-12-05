pkgname=primevideo
_pkgname=PrimeVideo
pkgver=1.0.4
pkgrel=1
_pkgrel_x86_64=1
pkgdesc="Unnofficial Prime Videos desktop application"
arch=('x86_64')
url="https://gitlab.com/primevideo/application"
license=('GPL')
depends=('libelectron' 'nss' 'gtk3' 'libxss' 'git')
makedepends=('unzip')
conflicts=("primevideo-git" "primevideo-bin")
source=("https://gitlab.com/primevideo/application/-/archive/$pkgver/application-$pkgver.tar.bz2")
sha256sums=('f90bfcd4a17da021aa85506eac0610c7ee59a1063f2be5d62f04fe3691884db7')

package() {
    for dir in application-$pkgver ; do mv "${dir}" "$_pkgname" ;done
    cd "$srcdir/$_pkgname"
    chmod +x $pkgname
    ln -sf "/opt/libelectron/node_modules" "$srcdir/$_pkgname"
    install -dm755 "$pkgdir/opt/$_pkgname"
    install -dm755 "$pkgdir/usr/share/pixmaps"    
    cp -r ./ "$pkgdir/opt/$_pkgname"
    cp -r "$pkgdir/opt/$_pkgname/$pkgname.svg" "$pkgdir/usr/share/pixmaps" 

    # Link to binary
    install -dm755 "$pkgdir/usr/bin"
    ln -s "/opt/$_pkgname/$pkgname" "$pkgdir/usr/bin/$pkgname"

    # Desktop Entry
    install -Dm644 "$srcdir/$_pkgname/$_pkgname.desktop" \
        "$pkgdir/usr/share/applications/$_pkgname.desktop"
    sed -i s%/usr/share%/opt% "$pkgdir/usr/share/applications/$_pkgname.desktop"
}
