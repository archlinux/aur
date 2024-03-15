pkgname=privatebin
pkgver=1.7.1
pkgrel=1
pkgdesc="a minimalist, open source online pastebin where the server has zero knowledge of pasted data"
url='https://privatebin.info'
arch=("any")
license=("zlib")
depends=("php" "php-gd")
options=("emptydirs")
source=("$pkgname-$pkgver.tar.gz::https://github.com/PrivateBin/PrivateBin/archive/$pkgver.tar.gz")
md5sums=('db62eb947fae29c33c85bb0d642abd20')

package(){
    cd PrivateBin-$pkgver
    mkdir -p "$pkgdir/usr/share/webapps/$pkgname"
    cp -R * "$pkgdir/usr/share/webapps/$pkgname"
    install -Dm644 LICENSE.md "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    mkdir -p "$pkgdir/etc/webapps/"
    mv "$pkgdir/usr/share/webapps/$pkgname/cfg" "$pkgdir/etc/webapps/$pkgname/"
    ln -s /etc/webapps/$pkgname "$pkgdir/usr/share/webapps/$pkgname/cfg"
    # data and runtime folders
    for folder in model purgelimit trafficlimits;
    do
        mkdir -p "$pkgdir/var/lib/$pkgname/$folder"
    done
}
