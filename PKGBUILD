# Maintainer: mcniki <sawwa.cwer13 at gmail dot com>

pkgname=codecontext-ai


pkgver=1.25.3
pkgrel=1
pkgdesc='AI-powered codebase analyzer — scans project structure, builds dependency graphs, generates LLM-optimized prompts with minification, skeleton mode, and JSON patching'
arch=('any')
url='https://github.com/NIKIRIKI7/CodeContext'
license=('MIT')
depends=('python' 'python-pyside6' 'python-tiktoken' 'python-fpdf2' 'python-pyperclip' 'python-pathspec' 'python-jinja')
makedepends=('git')
install=codecontext.install
optdepends=('python-pytest: run test suite'
            'python-pytest-asyncio: async test support'
            'python-pytest-cov: test coverage reports')
provides=('codecontext')
source=("$pkgname-$pkgver.tar.gz::https://github.com/NIKIRIKI7/CodeContext/archive/refs/tags/v${pkgver}.tar.gz"
        'codecontext.desktop')
sha256sums=('SKIP'
            '4a43d3ba77f25fe40608c47aeeba3fca2008191c72900eafb70b1994b9e4d006')

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
