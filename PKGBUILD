# Maintainer: mcniki <sawwa.cwer13 at gmail dot com>

pkgname=codecontext-ai
pkgver=1.14.0
pkgrel=1
pkgdesc="AI-powered codebase analysis and prompt preparation tool for LLMs (ChatGPT, Claude, Cursor)"
arch=('any')
url="https://github.com/NIKIRIKI7/CodeContext"
license=('MIT')
depends=('python' 'python-pyside6' 'python-tiktoken' 'python-fpdf2' 'python-pyperclip' 'python-pathspec' 'python-jinja')
makedepends=('git')
source=("$pkgname-$pkgver.tar.gz::https://github.com/NIKIRIKI7/CodeContext/archive/refs/tags/v${pkgver}.tar.gz"
        "codecontext.desktop")
sha256sums=('SKIP'
            'SKIP')

package() {
    cd "$srcdir/CodeContext-$pkgver"

    install -dm755 "$pkgdir/opt/$pkgname"
    cp -a . "$pkgdir/opt/$pkgname/"

    install -dm755 "$pkgdir/usr/bin"
    cat <<EOF > "$pkgdir/usr/bin/codecontext"
#!/bin/sh
exec python /opt/$pkgname/main.py "\$@"
EOF
    chmod +x "$pkgdir/usr/bin/codecontext"

    install -Dm644 "$srcdir/codecontext.desktop" "$pkgdir/usr/share/applications/$pkgname.desktop"
    install -Dm644 assets/images/logo.png "$pkgdir/usr/share/pixmaps/$pkgname.png"
}
