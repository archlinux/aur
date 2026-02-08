# Maintained by glacier54 on GitHub
pkgver=0.1.3
pkgname="goonfetch"
pkgdesc="A fetch utility for fetching rule 34 images"
pkgrel=3
arch=('any')
url="https://github.com/glacier54/goonfetch/"
license=('MIT')
depends=('python')
makedepends=('uv')
source=("https://github.com/glacier54/goonfetch/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('68170380a4a6567f1c6ac1e772fe68970f20419744147af1c79e444d3eb16b57')

build() {
    cd "$srcdir/$pkgname-$pkgver"
    uv sync
}

package () {
    cd "$srcdir/$pkgname-$pkgver"
    install -d  "$pkgdir/usr/lib/goonfetch"
    cp -r . "$pkgdir/usr/lib/goonfetch/"
    install -Dm755 /dev/stdin "$pkgdir/usr/bin/goonfetch" <<'EOF'
#!/usr/bin/env bash
cd /usr/lib/goonfetch || exit 1
.venv/bin/python main.py "$@"
EOF
}
