# Maintainer: Ruijie Yu <ruijie.yu@outlook.com>

pkgname=emacs-crdt
_pkgname=crdt
pkgver=0.1.4
pkgrel=1
pkgdesc='Collaborative editing using Conflict-free Replicated Data Types'
url='https://code.librehq.com/qhong/crdt.el'
license=(GPL)
arch=(any)
depends=(
    emacs
)

source=("$pkgname-$pkgver.tar.gz::$url/-/archive/v0.1.4/crdt.el-v0.1.4.tar.gz")
sha512sums=('29cff21226ffac037d8158bae331c8c4977331f33317e9236b5cb201ec9eeff3f95e8094fc8b5f447869982a84334df8931090d4b1e28727724541b9dc9cc3dc')
b2sums=('6d0b8c8d2ffcc8841e814fe1cffbd37fae8d572db15f78fc17932ed7035987290922f37322255015b70313fa481964ed3b01dfae293396755d4b453d06259e63')

# crdt.el-v0.1.4
CD_DIR="$_pkgname.el-v$pkgver"

build() {
    # byte-compile all *.el files
    cd "$srcdir/$CD_DIR"
    EMACSFLAGS=(-batch -q --no-site-file)
    EMACSCOMPFLAGS=(-L .)
    /usr/bin/emacs "${EMACSFLAGS[@]}" \
                   "${EMACSCOMPFLAGS[@]}" \
                   -f batch-byte-compile \
                   *.el
}

package() {
    # install all *.el and *.elc files
    cd "$srcdir/$CD_DIR"
    install -Dm0644 \
            *.el{,c} \
            -t "$pkgdir/usr/share/emacs/site-lisp/"

    # doc files
    install -Dm0644 \
            COPYING {HACKING,README}.org \
            -t "$pkgdir/usr/share/doc/$pkgname/"
}
