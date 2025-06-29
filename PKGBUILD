pkgname=dotpusher
pkgver=0.1.0
pkgrel=1
pkgdesc="Declarative dotfiles manager using Git and JSON state tracking"
arch=('x86_64')
url="https://github.com/maarutan/dotpusher"
license=('MIT')
depends=()
makedepends=('python' 'pyinstaller')
source=("$pkgname-$pkgver.tar.gz::https://github.com/maarutan/dotpusher/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('f8a4c3f9549eec56d03eb21ae4b45177aa876543738acf6567a1b032f350ab0e')

build() {
    cd "$srcdir/$pkgname-$pkgver"
    if command -v pyinstaller >/dev/null 2>&1; then
        pyinstaller --onefile --name=dotpusher main.py
    else
        echo ":: pyinstaller not found — fallback not supported in AUR builds"
        exit 1
    fi
}

package() {
    cd "$srcdir/$pkgname-$pkgver"
    install -Dm755 "dist/dotpusher" "$pkgdir/usr/bin/dotpusher"
}

