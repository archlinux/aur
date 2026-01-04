# Maintainer: Rotko Networks <noc@rotko.net>
pkgname=jmap-mcp
pkgver=0.1.0
pkgrel=1
pkgdesc="mcp server for jmap email - works with claude desktop, cursor, and other mcp clients"
arch=('any')
url="https://github.com/rotkonetworks/jmap-mcp"
license=('MIT')
depends=('deno')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('f52e32b3a83164f4293af5b685005b97e7cc70d562fdb1abd224620f58fb16f7')

package() {
    cd "$srcdir/$pkgname-$pkgver"

    # install source files
    install -dm755 "$pkgdir/usr/share/$pkgname"
    cp -r src "$pkgdir/usr/share/$pkgname/"
    install -Dm644 deno.json "$pkgdir/usr/share/$pkgname/deno.json"

    # create wrapper script
    install -dm755 "$pkgdir/usr/bin"
    cat > "$pkgdir/usr/bin/$pkgname" << 'EOF'
#!/bin/sh
exec deno run --allow-env --allow-net /usr/share/jmap-mcp/src/mod.ts "$@"
EOF
    chmod 755 "$pkgdir/usr/bin/$pkgname"

    # install license
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
