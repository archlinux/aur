# Maintainer: Michal Sotolar <michal at sotolar dot com>

pkgname=ttf-qr-font
pkgver=1.0.0
pkgrel=3

pkgdesc="Jim's TrueType QR Code Font"
arch=('any')
url='https://qr.jim.sh/'
license=('custom:SIL Open Font License')

makedepends=(
    'ttf-liberation'
    'uv'
)

_srcdir='qr-font'

source=("$_srcdir::git+https://github.com/jimparis/qr-font.git#tag=v$pkgver")

build() {
    cd $_srcdir
    uv run tools/build_font.py --base-font /usr/share/fonts/liberation/LiberationSans-Regular.ttf
}

package() {
    cd $_srcdir
    install -Dm644 dist/qrfont-{1,2,3}L.ttf -t "$pkgdir/usr/share/fonts/qr-font"
    install -Dm644 LICENSE-OFL.txt -t "$pkgdir/usr/share/licenses/$pkgname"
}

b2sums=('c7a2a3655bdb3aa93ec03dea5c3f6002905a0920ed660d147ff821991748914a73610a2ce0159f9bc9385e29df1e2aef5330836cebee3c5429194b96473efc3e')
