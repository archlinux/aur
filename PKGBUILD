# Maintainer: Ariel Baron <arielbar80@gmail.com>

pkgname=dotidx
pkgver=2.0.6
pkgrel=1
pkgdesc="A declarative, multi-profile dotfile manager focused on physical isolation and manifest-based tracking."
arch=('any')
url="https://github.com/ArielBaron/dotidx"
license=('MIT')
depends=('python' 'python-rich' 'python-textual' 'rsync' 'git' 'jq')
makedepends=('git')
source=("${pkgname}::git+${url}.git#tag=v${pkgver}")
sha256sums=('968f92d86e25e02cbc284a3aa85ff7d6c51d246e5c52f30fcb6375e065d2bd74')

package() {
  cd "$srcdir/$pkgname"
  
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
