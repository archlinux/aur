# Maintainer: Razon Yang <razonyang@gmail.com>
pkgname=wechat-devtool
pkgver=1.02.1902010
pkgrel=1
arch=('any')
depends=(
    'wine'
)
source=(
    "https://github.com/cytle/wechat_web_devtools/archive/v$pkgver.tar.gz"
)
md5sums=(
    'cdc1c88e3dd187d06d9b51b5a321755f'
)
package() {
    mkdir -p "$pkgdir/opt"
    cp -r "$srcdir/wechat_web_devtools-$pkgver" "$pkgdir/opt/$pkgname"
    cd "$pkgdir/opt/$pkgname/bin"
    "$pkgdir/opt/$pkgname/bin/wxdt" install
    mkdir -p "$pkgdir/usr/bin/$pkgname"
    
    # desktop entry
    mkdir -p "$pkgdir/usr/share/applications"
    sed "s/path\/to/opt\/$pkgname/g" "$pkgdir/opt/$pkgname/desktop.example" > "$pkgdir/usr/share/applications/$pkgname.desktop"
}
