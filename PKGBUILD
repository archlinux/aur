pkgname=tabracing
_pkgname=TAB
pkgver=1.0.2.aurpatch
pkgrel=2
pkgdesc="Unofficial TAB Australia desktop application."
arch=('x86_64' 'arm7h' 'aarch64')
url="https://gitlab.com/linuxbombay/tab/"
license=('GPL')
depends=('libelectron>=2025.1' 'nss' 'gtk3' 'libxss' 'git')
makedepends=('unzip')
source=("$url/application/-/archive/$pkgver/application-$pkgver.tar.bz2")
sha256sums=('2cae5cd74a80c21aa60e2e6393577547b1e619791590ba40b71a6c4a44e6c134')

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
    ln -s "/opt/libelectron/electron" "$pkgdir/opt/$_pkgname"
    ln -s "/opt/$_pkgname/tabracing" "$pkgdir/usr/bin/tabracing"

    # Desktop Entry
    install -Dm644 "$srcdir/application-$pkgver/tab.desktop" \
        "$pkgdir/usr/share/applications/tab.desktop"
    sed -i s%/usr/share%/opt% "$pkgdir/usr/share/applications/tab.desktop"
}
