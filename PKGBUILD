# Maintainer: Nan Wu <nanwu at example dot com>

pkgname=lininn-openflow
_pkgname=@lininn/openflow
pkgver=0.4.6
pkgrel=1
pkgdesc="OpenSpec + Superpowers workflow orchestrator for agentic development"
arch=('x86_64')
url="https://github.com/lininn/openflow"
license=('MIT')
depends=('nodejs>=18.0.0')
makedepends=('npm')
source=("$pkgname-$pkgver.tgz::https://registry.npmjs.org/$_pkgname/-/openflow-$pkgver.tgz")
sha256sums=('931896e47ba474e201b0021a6e5d91cfb6ff6911559bedc6522ea9bcf01500a9')

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
