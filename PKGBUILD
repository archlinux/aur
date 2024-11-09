# Maintainer: x45k
pkgname=ai-cli
pkgver=1.0.0
pkgrel=1
pkgdesc="Google Gemini, but in a command line."
arch=('any')
url="https://github.com/x45k/ai-cli/"
license=('MIT')
depends=('nodejs' 'npm')
makedepends=('make')

source=(
  'ai-cli.sh'
  'main.js'
  '.env'
  'package.json'
)

sha256sums=('1b968e3377a33497a77ea75da0e0bbd566e2f2e909985b14be1ef7d5f19ee700' 
            '5d72f88d080b6dec1ed75c7c35206d8984c69bafd3fd46b0086a65d280451468' 
            '1b30262a1138c217fcb045480bf7bbc1290c08bf67e6a2fdf2f15589c0bfd853' 
            'c0148ade42b1cc0289caf732e8a595ca8c80989c3e6131aff1edbe09909f2ce1')

package() {
  install -Dm755 "$srcdir/ai-cli.sh" "$pkgdir/usr/bin/ai-cli.sh"

  install -Dm644 "$srcdir/main.js" "$pkgdir/usr/share/ai-cli/main.js"
  install -Dm644 "$srcdir/.env" "$pkgdir/usr/share/ai-cli/.env"
  install -Dm644 "$srcdir/package.json" "$pkgdir/usr/share/ai-cli/package.json"

  mkdir -p "$pkgdir/usr/local/bin"

  echo '#!/bin/bash' > "$pkgdir/usr/local/bin/ai-cli"
  echo 'node /usr/share/ai-cli/main.js "$@"' >> "$pkgdir/usr/local/bin/ai-cli"

  chmod +x "$pkgdir/usr/local/bin/ai-cli"

  cd "$srcdir"
  npm install --prefix "$pkgdir/usr/share/ai-cli"
}
