# Maintainer: raf rafdog35@gmail.com
pkgname=sudos-eyes
pkgver=1.0
pkgrel=1
pkgdesc="Ever wanted sudo to fight back? well, now sudo is here to annoy you permanently."
arch=('any')
url="https://github.com/rafdog1222/sudos-eyes"
license=('WTFPL')
depends=('bash')
source=("$pkgname-$pkgver.tar.gz::https://github.com/rafdog1222/sudos-eyes/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('SKIP')

package() {
    cd "$srcdir/$pkgname-$pkgver"

    # install the fake sudo wrapper
    install -Dm755 sudo "$pkgdir/usr/lib/sudos-eyes/sudo"

    # install questions
    install -Dm644 questions/default.txt "$pkgdir/usr/lib/sudos-eyes/questions/default.txt"

    # install helper scripts
    install -Dm755 install.sh "$pkgdir/usr/lib/sudos-eyes/install.sh"
    install -Dm755 uninstall.sh "$pkgdir/usr/lib/sudos-eyes/uninstall.sh"

    # install docs
    install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

    # install a system-wide launcher that tells the user to run install.sh
    install -Dm755 /dev/stdin "$pkgdir/usr/bin/sudos-eyes" <<'EOF'
#!/usr/bin/env bash
echo ""
echo "  👁  sudo's-eyes is installed at /usr/lib/sudos-eyes/"
echo ""
echo "  to activate it for your user, run:"
echo "    /usr/lib/sudos-eyes/install.sh"
echo ""
echo "  to remove it from your user:"
echo "    /usr/lib/sudos-eyes/uninstall.sh"
echo ""
echo "  it's watching."
echo ""
EOF
}
