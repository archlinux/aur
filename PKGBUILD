# Maintained by glacier54 on GitHub
pkgver=0.1.2
pkgname="goonfetch"
pkgdesc="A fetch utility for fetching rule 34 images"
pkgrel=2
arch=('any')
url="https://github.com/glacier54/goonfetch/"
license=('MIT')
depends=('poetry' 'python')
source=("https://github.com/glacier54/goonfetch/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('353a62e6632b9da433c1b244f7eb6677ad2f48a69c60d72779405422ab2d41b5')

build() {
    cd "$srcdir/$pkgname-$pkgver"
    poetry install --no-root
}

package () {
    cd "$srcdir/$pkgname-$pkgver"
    install -d  "$pkgdir/usr/lib/goonfetch"
    cp -r . "$pkgdir/usr/lib/goonfetch/"
    install -Dm755 /dev/stdin "$pkgdir/usr/bin/goonfetch" <<'EOF'
#!/usr/bin/env bash
cd /usr/lib/goonfetch || exit 1
poetry run python main.py "$@"
EOF
}
