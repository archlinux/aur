#Maintainer: Sam Bazley <sambazley@protonmail.com>
pkgname=blockbar-git
pkgver=20190211144316
pkgrel=1
pkgdesc="Blocks based status bar for X window managers"
arch=("i686" "x86_64")
url="https://gitlab.com/sambazley/blockbar"
license=("ZLIB")
makedepends=("cmake")
depends=("cairo" "pango" "libxrandr" "ujson-git")
source=("git+https://gitlab.com/sambazley/blockbar.git")
md5sums=("SKIP")

pkgver() {
    cd blockbar
    git show -s --format=%ci HEAD | cut -d' ' -f1-2 | sed -r 's/[^0-9]//g'
}

build() {
    cd "$srcdir/blockbar"
    cmake -DCMAKE_INSTALL_PREFIX="$pkgdir/usr" -DLIBDIR="/usr/lib" .
    make
}

package() {
    cd blockbar
    make install

    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

    install -Dm644 autocomplete/bbc.bash \
        "$pkgdir/usr/share/bash-completion/completions/bbc"
    install -Dm644 autocomplete/bbc.zsh \
        "$pkgdir/usr/share/zsh/site-functions/_bbc"
}
