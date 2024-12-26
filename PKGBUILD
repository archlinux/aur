pkgname=tabracing
_pkgname=TAB
pkgver=1.0.0
pkgrel=1
pkgdesc="Unofficial TAB Australia desktop application."
arch=('x86_64' 'arm7h' 'aarch64')
url="https://gitlab.com/linuxbombay/tab/"
license=('GPL')
depends=('libelectron' 'nss' 'gtk3' 'libxss' 'git')
makedepends=('unzip')
source=("$url/application/-/archive/$pkgver/application-$pkgver.tar.bz2")
sha256sums=('aa545900cb3183f3a1631d08f99c47dd2a51d50275ae370d3c2fcf71b0cd0d33')

package() {
    cd "$srcdir/application-$pkgver"
    chmod +x tabracing
    ln -sf "/opt/libelectron/node_modules" "$srcdir/application-$pkgver"
    install -dm755 "$pkgdir/opt/$_pkgname"
    install -dm755 "$pkgdir/usr/share/pixmaps"    
    cp -r ./ "$pkgdir/opt/$_pkgname"
    cp -r "$srcdir/application-$pkgver/tabracing.svg" "$pkgdir/usr/share/pixmaps"  

    # Link to binary
    install -dm755 "$pkgdir/usr/bin"
    ln -s "/opt/$_pkgname/tabracing" "$pkgdir/usr/bin/tabracing"

    # Desktop Entry
    install -Dm644 "$srcdir/application-$pkgver/tab.desktop" \
        "$pkgdir/usr/share/applications/tab.desktop"
    sed -i s%/usr/share%/opt% "$pkgdir/usr/share/applications/tab.desktop"
}
