pkgname=nfx-bin
pkgver=1.0.0
pkgrel=1
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

sha256sums=('0093b35c47ba527a998ed3016c2873eba1ce2d06d9a0d275f37c3e398fb12fef')

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