pkgname=cs2-chat-translator
pkgver=1.0.0
pkgrel=1
pkgdesc="CS2 console.log chat translator (tm_/_tl/code_ + auto translate)."
arch=('any')
url="https://github.com/MeckeDev/cs2-chat-translator"
license=('MIT')
depends=('nodejs' 'xdotool')
makedepends=('npm')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('d728b8e0b7cbdf19bf001a313d26590e931671a2b85f92cb611739caeab72125')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  npm install --omit=dev
}

package() {
  cd "$srcdir/$pkgname-$pkgver"

  # Install app into /usr/lib
  install -dm755 "$pkgdir/usr/lib/$pkgname"
  cp -r . "$pkgdir/usr/lib/$pkgname"

  # Create launcher in /usr/bin
  install -dm755 "$pkgdir/usr/bin"
  cat > "$pkgdir/usr/bin/cs2-chat-translator" << 'EOF'
#!/bin/sh
exec node /usr/lib/cs2-chat-translator/bin/cs2-chat-translator.js "$@"
EOF
  chmod 755 "$pkgdir/usr/bin/cs2-chat-translator"
}
