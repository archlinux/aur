# Maintainer: msfire <matteosalis04@gmail.com>
pkgname=ms-regfx
pkgver=0.1.1
pkgrel=1
pkgdesc="Digital Forensics tool for parsing Windows Registry hive files (REGF format)"
arch=('any')
url="https://github.com/MS-0x404/ms-regfx"
license=('GPL3')
depends=('python')
source=("$pkgname-$pkgver.tar.gz::https://github.com/MS-0x404/$pkgname/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('a76a2330399c92659bc15a92c580763a6a81d055ab5fb9b1fa8cffe9f23e81b0')

package() {
    cd "$srcdir/$pkgname-$pkgver"
    install -Dm755 main.py "$pkgdir/usr/lib/$pkgname/main.py"
    install -dm755 "$pkgdir/usr/lib/$pkgname/core"
    install -dm755 "$pkgdir/usr/lib/$pkgname/outputs"
    install -Dm644 core/*.py "$pkgdir/usr/lib/$pkgname/core/"
    install -Dm644 outputs/*.py "$pkgdir/usr/lib/$pkgname/outputs/"
    
    # comando regfx
    install -dm755 "$pkgdir/usr/bin"
    cat > "$pkgdir/usr/bin/regfx" << 'EOF'
#!/bin/bash
exec python /usr/lib/ms-regfx/main.py "$@"
EOF
    chmod +x "$pkgdir/usr/bin/regfx"
    
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
