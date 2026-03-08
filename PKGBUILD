# Maintainer: Rukeh
pkgname=vnmanager
pkgver=0.2.0
pkgrel=1
pkgdesc="A cute desktop app for tracking your visual novel backlog, powered by Kana API by VNDB"
arch=('any')
url="https://github.com/Rukeh/VnManager"
license=('MIT')
depends=('python' 'tk' 'python-pillow' 'python-requests' 'python-customtkinter')
source=("$pkgname-$pkgver.tar.gz::https://github.com/Rukeh/VnManager/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('81b447172ad6164bc4ae9e0b1687dcdd4d09d0ca5fa2eb9c98468483d2f50a89')

package() {
    cd "VnManager-$pkgver"

    install -dm755 "$pkgdir/opt/$pkgname"
    cp -r app main.py requirements.txt "$pkgdir/opt/$pkgname/"
    cp -r assets "$pkgdir/opt/$pkgname/"

    install -dm755 "$pkgdir/usr/bin"
    cat > "$pkgdir/usr/bin/$pkgname" <<EOF
#!/bin/bash
exec python /opt/$pkgname/main.py "\$@"
EOF
    chmod +x "$pkgdir/usr/bin/$pkgname"

    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
