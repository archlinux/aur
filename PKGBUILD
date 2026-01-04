# Maintainer: Rotko Networks <noc@rotko.net>
pkgname=jmapper
pkgver=0.1.0
pkgrel=1
pkgdesc="token-efficient jmap email cli for ai agents - tsv output, minimal tokens"
arch=('any')
url="https://github.com/rotkonetworks/jmap-mcp"
license=('MIT')
depends=('deno')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('f52e32b3a83164f4293af5b685005b97e7cc70d562fdb1abd224620f58fb16f7')

package() {
    cd "$srcdir/jmap-mcp-$pkgver"

    # install the typescript source
    install -Dm644 jmapper.ts "$pkgdir/usr/share/$pkgname/jmapper.ts"

    # create wrapper script
    install -dm755 "$pkgdir/usr/bin"
    cat > "$pkgdir/usr/bin/$pkgname" << 'EOF'
#!/bin/sh
exec deno run --allow-env --allow-net /usr/share/jmapper/jmapper.ts "$@"
EOF
    chmod 755 "$pkgdir/usr/bin/$pkgname"

    # install license
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
