pkgname=pactool
pkgver=1.0.2
pkgrel=1
pkgdesc="A versatile package management helper for Arch and Debian-based systems."
arch=('any')
url="https://github.com/LinuxUtils/pactool"
license=('MIT')
depends=('python')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('2e35f2fa8efed23a0481c11e0e08fd57f2b2e3aafcc2c41b2b4e6b84673e86a8')


package() {
    cd "$srcdir/$pkgname-$pkgver/src"
    install -Dm755 pactool.py "$pkgdir/usr/share/$pkgname/pactool.py"
    cp -r core "$pkgdir/usr/share/$pkgname/core"
    cp -r operations "$pkgdir/usr/share/$pkgname/operations"
    install -Dm755 /dev/stdin "$pkgdir/usr/bin/$pkgname" << EOF
#!/bin/bash
PYTHONPATH="/usr/share/$pkgname" exec python /usr/share/$pkgname/pactool.py "\$@"
EOF
}
