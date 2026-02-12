# Maintained by glacier54 on GitHub
pkgver=0.1.5
pkgname="goonfetch"
pkgdesc="A fetch utility for fetching rule 34 images"
pkgrel=1
arch=('any')
url="https://github.com/glacier54/goonfetch/"
license=('MIT')
depends=('python')
makedepends=('uv')
source=("https://github.com/glacier54/goonfetch/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('f173049a3c6e9a03a5de7bcc1a0dbf49a9e70e7888cad26f54d01df1fa835ea5')

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
