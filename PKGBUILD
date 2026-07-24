# Maintainer: Ariel Baron <arielbar80@gmail.com>

pkgname=dotidx
pkgver=3.3.8
pkgrel=1
pkgdesc="A declarative, multi-profile dotfile manager focused on physical isolation and manifest-based tracking."
arch=('any')
url="https://github.com/ArielBaron/dotidx"
license=('MIT')
depends=('python' 'python-rich' 'python-textual' 'rsync' 'git' 'jq')
makedepends=('git')
source=("https://github.com/ArielBaron/dotidx/archive/refs/tags/v3.3.8.tar.gz")
sha256sums=('83094771ebbfb98f247da88806baffe3815c6adf4400b82cf53e059f73fb9b4b')

package() {
  cd "$srcdir/${pkgname}-${pkgver}"
  
  install -dm755 "$pkgdir/usr/share/dotidx"
  cp -r *.py "$pkgdir/usr/share/dotidx/"
  cp -r scripts "$pkgdir/usr/share/dotidx/"
  
  mkdir -p "$pkgdir/usr/bin"
  cat > "$pkgdir/usr/bin/dotidx" << 'INNEREOF'
#!/bin/bash
PYTHONPATH="/usr/share/dotidx:$PYTHONPATH" exec /usr/bin/python3 /usr/share/dotidx/main.py "$@"
INNEREOF
  chmod +x "$pkgdir/usr/bin/dotidx"
}
