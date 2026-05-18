pkgname=nfx-bin
pkgver=1.0.1
pkgrel=2
pkgdesc="Cross-platform package manager for the Pheonix Studios ecosystem"

arch=('x86_64')

url="https://github.com/Pheonix-Studios-Git/NFX"

license=('MIT')

depends=('glibc')

provides=('nfx')
conflicts=('nfx')

options=('!strip')

source=(
    "https://pheonix-studios-git.github.io/PPI/data/NFX/nfx_zip/NFX-v${pkgver}.zip"
)

sha256sums=('c343097feeb001e554eec6c44f58c2353a551f90b649ee8e23a7f7b8f9dd6952')

prepare() {
    cd "$srcdir"
    bsdtar -xf NFX-v${pkgver}.zip
}

check() {
    "$srcdir/bin/linux/x86_64/dist/nfx" version >/dev/null
}

package() {
    install -Dm755 \
        "$srcdir/bin/linux/x86_64/dist/nfx" \
        "$pkgdir/usr/bin/nfx"

    install -Dm644 \
        "$srcdir/LICENSE" \
        "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

    install -Dm644 \
        "$srcdir/README.md" \
        "$pkgdir/usr/share/doc/$pkgname/README.md"
}
