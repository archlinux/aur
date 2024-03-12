# Maintainer: RiddlerXenon riddler.xenon@gmail.com
pkgname=ddh
pkgver=1.0.0
pkgrel=1
pkgdesc="Dynamic Display Handler"
arch=('any')
url="https://github.com/RiddlerXenon/DynamicDisplayHandler"
license=('GPL')
depends=('xorg-server' 'systemd' 'awk' 'grep' 'sed')
source=("$pkgname-$pkgver.tar.gz"::"$url/archive/v$pkgver.tar.gz")
sha256sums=('336259b5e7b8637bdd81dfe06cac982326b15f015feb21ad5d0da6247790f44a')

package() {
    cd "$srcdir/DynamicDisplayHandler-$pkgver"

    install -Dm755 ddh.sh "$pkgdir/usr/local/bin/ddh.sh"
    install -Dm755 install.sh "$pkgdir/usr/local/bin/install-ddh.sh"
    install -Dm755 uninstall.sh "$pkgdir/usr/local/bin/uninstall-ddh.sh"
}

post_install() {
    chmod +x /usr/local/bin/install-ddh.sh
    /usr/local/bin/install-ddh.sh
    rm /usr/local/bin/install-ddh.sh

    systemctl daemon-reload
    systemctl enable ddh
    systemctl start ddh
}

post_remove() {
    chmod +x /usr/local/bin/uninstall-ddh.sh
    /usr/local/bin/uninstall-ddh.sh    
    rm /usr/local/bin/uninstall-ddh.sh
}
