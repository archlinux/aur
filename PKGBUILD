# Maintainer: Nan Wu <nanwu at example dot com>

pkgname=lininn-openflow
_pkgname=@lininn/openflow
pkgver=0.5.0
pkgrel=1
pkgdesc="OpenSpec + Superpowers workflow orchestrator for agentic development"
arch=('x86_64')
url="https://github.com/lininn/openflow"
license=('MIT')
depends=('nodejs>=18.0.0' 'openspec')
makedepends=('npm')
source=("$pkgname-$pkgver.tgz::https://registry.npmjs.org/$_pkgname/-/openflow-$pkgver.tgz")
sha256sums=('a3032793d5f43d5da2fae58d178b9a68c51b3a0cdc81b0c2a07d200f1532b597')

package() {
    cd "$srcdir/package"

    # Install production npm dependencies (skip postinstall script)
    npm install --omit=dev --ignore-scripts --no-fund --no-audit
    rm -f package-lock.json

    # Install to global node_modules location
    install -d "$pkgdir/usr/lib/node_modules/@lininn"
    cp -r "$srcdir/package/" "$pkgdir/usr/lib/node_modules/@lininn/openflow"

    # Install license
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

    # Create bin symlink
    install -d "$pkgdir/usr/bin"
    ln -s "/usr/lib/node_modules/@lininn/openflow/bin/openflow.js" "$pkgdir/usr/bin/openflow"
}
