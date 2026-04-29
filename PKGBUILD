# Maintainer: Darian Alberto Camacho Salas <xiondu@gmail.com>
# #Somos XONIDU

pkgname=xoniter
pkgver=1.0.0
pkgrel=1
pkgdesc="Lightweight web-based remote command executor for headless Linux systems"
arch=('any')
url="https://github.com/XONIDU/xoniter"
license=('MIT')
depends=('python')
optdepends=('python-flask: web framework'
            'python-qrcode: QR code generation'
            'python-pillow: image processing')
source=("$pkgname-$pkgver.tar.gz::https://github.com/XONIDU/xoniter/archive/v$pkgver.tar.gz")
sha256sums=('8c1c5f9e5fc4ca18fca8f7b2992e54e0dd4c610e3f7b412c8f3b0b1f4c037fe9')

package() {
    install -d "$pkgdir/usr/share/$pkgname/templates"
    install -d "$pkgdir/usr/bin"
    
    install -Dm755 "$srcdir/$pkgname-$pkgver/xoniter.py" "$pkgdir/usr/share/$pkgname/xoniter.py"
    install -Dm755 "$srcdir/$pkgname-$pkgver/start.py" "$pkgdir/usr/share/$pkgname/start.py"
    
    cp -r "$srcdir/$pkgname-$pkgver/templates" "$pkgdir/usr/share/$pkgname/"
    
    cat > "$pkgdir/usr/bin/$pkgname" << 'EOF'
#!/bin/bash
cd /usr/share/xoniter
python3 xoniter.py "$@"
EOF
    chmod 755 "$pkgdir/usr/bin/$pkgname"
    
    cat > "$pkgdir/usr/bin/$pkgname-start" << 'EOF'
#!/bin/bash
cd /usr/share/xoniter
python3 start.py "$@"
EOF
    chmod 755 "$pkgdir/usr/bin/$pkgname-start"
}
