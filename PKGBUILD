# Maintainer: msfire <matteosalis04@gmail.com>
pkgname=ms-regfx
pkgver=0.1.4
pkgrel=1
pkgdesc="Digital Forensics tool for parsing Windows Registry hive files (REGF format)"
arch=('any')
url="https://github.com/MS-0x404/ms-regfx"
license=('GPL3')
depends=('python')
source=("$pkgname-$pkgver.tar.gz::https://github.com/MS-0x404/$pkgname/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('abf169b5503f0ac17c4405baa7abd25210bd5a5c693e4d8a71b2e3289c3da953')

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
