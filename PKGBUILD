pkgname=dotpusher
pkgver=0.1.1
pkgrel=1
pkgdesc="Declarative dotfiles manager using Git and JSON state tracking"
arch=('x86_64')
url="https://github.com/maarutan/dotpusher"
license=('MIT')
depends=('python')
makedepends=('pyinstaller')
source=("dotpusher.zip::https://github.com/maarutan/dotpusher/releases/download/v${pkgver}/dotpusher.zip")
sha256sums=('SKIP')

options=('!debug')

prepare() {
    unzip -o "$srcdir/dotpusher.zip" -d "$srcdir"
}

build() {
    cd "$srcdir/$pkgname" || exit
    pyinstaller --onefile --name=dotpusher main.py
}

package() {
    cd "$srcdir/$pkgname" || exit
    install -Dm755 "dist/dotpusher" "$pkgdir/usr/bin/dotpusher"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

