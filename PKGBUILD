pkgname=tubi
_pkgname=Tubi
pkgver=1.0.6.aurpatch
pkgrel=1
_pkgrel_x86_64=1
pkgdesc="Unnofficial Tubi desktop application"
arch=('x86_64')
url="https://gitlab.com/linuxbombay/tubidesktop"
license=('GPL')
depends=('electroncastlab-bin' 'libelectron' 'nss' 'gtk3' 'libxss' 'git')
makedepends=('unzip')
source=("$url/application/-/archive/$pkgver/application-$pkgver.tar.bz2")
sha256sums=('ba788e697dbf71c192417964c428f58c93795dbf71541c9b8c8635762d9fae98')

package() {
    cd "$srcdir/application-$pkgver"
    chmod +x $pkgname
    ln -sf "/opt/libelectron/node_modules" "$srcdir/application-$pkgver"
    install -dm755 "$pkgdir/opt/$_pkgname"
    install -dm755 "$pkgdir/usr/share/pixmaps"    
    cp -r ./ "$pkgdir/opt/$_pkgname"
    cp -r "$pkgdir/opt/$_pkgname/$pkgname.svg" "$pkgdir/usr/share/pixmaps" 

    # Link to binary
    install -dm755 "$pkgdir/usr/bin"
    ln -s "/usr/bin/electroncastlab" "/opt/$_pkgname/$pkgname"
    ln -s "/opt/$_pkgname/$pkgname" "$pkgdir/usr/bin/$pkgname"

    # Desktop Entry
    install -Dm644 "$srcdir/application-$pkgver/$pkgname.desktop" \
        "$pkgdir/usr/share/applications/$pkgname.desktop"
    sed -i s%/usr/share%/opt% "$pkgdir/usr/share/applications/$pkgname.desktop"
}
