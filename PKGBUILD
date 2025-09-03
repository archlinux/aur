pkgname=dummiesnmap
pkgver=1.0.0
pkgrel=1
pkgdesc="A dumbed-down version of nmap, wrapped in python, for people who can't remember 50 million flags"
arch=('any')
url="https://github.com/kaizokuv/dummiesnmap"
license=('GPL3')
depends=('python')
makedepends=()
source=("https://github.com/kaizokuv/dummiesnmap/archive/refs/tags/v1.0.1.tar.gz")
sha256sums=('a138c006712192ea78a1f008bd77ab0fa978953b4da785a6f1e6b3007e42e5fa')

package() {
    mkdir -p "$pkgdir/usr/lib/dummiesnmap"
    mkdir -p "$pkgdir/usr/bin"
    cd "dummiesnmap-$pkgver"
    cp main.py "$pkgdir/usr/lib/dummiesnmap/main.py"
    cp -r modules "$pkgdir/usr/lib/dummiesnmap/"
    cat << 'EOF' > "$pkgdir/usr/bin/dummiesnmap"
#!/usr/bin/env bash
PYTHONPATH=/usr/lib/dummiesnmap python3 /usr/lib/dummiesnmap/main.py "$@"
EOF

    chmod +x "$pkgdir/usr/bin/dummiesnmap"
}
