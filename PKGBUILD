pkgname=nfx-bin
pkgver=1.0.2
pkgrel=1
pkgdesc="Cross-platform package manager for the Pheonix Studios ecosystem"

arch=('x86_64')

url="https://github.com/Pheonix-Studios-Git/NFX"

license=('MIT')

depends=('glibc')

provides=('nfx')
conflicts=('nfx')

groups=('pheonix-ecosystem')

options=('!strip')

source=(
    "NFX-v${pkgver}.zip::https://pheonix-studios-git.github.io/PPI/data/NFX/nfx_zip/NFX-v${pkgver}.zip"
)

sha256sums=('e3085c52e346780c02dcfcd79f5d1b93525e761b570126f9adce56a7582f05dd')

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

    if [[ -f "$srcdir/LICENSE" ]]; then
        install -Dm644 \
            "$srcdir/LICENSE" \
            "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    fi

    if [[ -f "$srcdir/README.md" ]]; then
        install -Dm644 \
            "$srcdir/README.md" \
            "$pkgdir/usr/share/doc/$pkgname/README.md"
    fi
}