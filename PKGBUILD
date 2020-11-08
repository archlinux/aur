# Maintainer: PumpkinCheshire <sollyonzou@gmail.com>

_name=goptions
_author=voxelbrain
pkgname="golang-github-${_author}-${_name}"
pkgver=2.5.11
pkgrel=1
pkgdesc="A flexible parser for command line options"
arch=('x86_64' 'i686')
url="https://github.com/${_author}/${_name}"
license=('MIT')
depends=('go')
options=('!strip' '!emptydirs')
source=("$_name-$pkgver-$pkgrel.tar.gz::https://github.com/${_author}/${_name}/archive/$pkgver.tar.gz")
sha256sums=('cf4df6a6a7764867f50c278c87f941ab81722566d5e1198346c65a428ab5c874')

check() {
    export GOPATH="$srcdir/build:/usr/share/gocode"
    mkdir -p "$srcdir"/build/src/github.com/$_author
    cp -a "$srcdir"/$_name-$pkgver "$srcdir"/build/src/github.com/$_author/$_name
    cd "$srcdir/build/src/github.com/$_author/$_name"
    go test -v $(go list ./...)
}

package() {
    mkdir -p "$pkgdir/usr/share/gocode/src/github.com/$_author/"
    cp -a --preserve=timestamps "${_name}-${pkgver}" "$pkgdir/usr/share/gocode/src/github.com/$_author/$_name"

    # Package license (if available)
    for f in LICENSE COPYING LICENSE.txt COPYING.*; do
        if [ -e "$srcdir/${_name}-${pkgver}/$f" ]; then
            install -Dm644 "$srcdir/${_name}-${pkgver}/$f" "$pkgdir/usr/share/licenses/$pkgname/$f"
        fi
    done
}
