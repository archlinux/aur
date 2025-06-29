pkgname=dotpusher
pkgver=0.1.0
pkgrel=1
pkgdesc="Declarative dotfiles manager using Git and JSON state tracking"
arch=('any')
url="https://github.com/maarutan/dotpusher"
license=('MIT')
depends=()
makedepends=('python' 'pyinstaller')
source=("$pkgname-$pkgver.tar.gz::https://github.com/maarutan/dotpusher/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('SKIP')

build() {
    if command -v pyinstaller >/dev/null 2>&1; then
        pyinstaller --onefile --name=dotpusher main.py
    else
        echo ":: warning: pyinstaller not found — fallback to raw script"
        install -Dm755 main.py dist/dotpusher
    fi
}


package() {
    install -Dm755 "dist/dotpusher" "$pkgdir/usr/bin/dotpusher"
}

