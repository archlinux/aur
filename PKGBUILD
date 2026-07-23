# Maintainer: Ariel Baron <arielbar80@gmail.com>

pkgname=dotidx
pkgver=3.3.1
pkgrel=1
pkgdesc="A declarative, multi-profile dotfile manager focused on physical isolation and manifest-based tracking."
arch=('any')
url="https://github.com/ArielBaron/dotidx"
license=('MIT')
depends=('python' 'python-rich' 'python-textual' 'rsync' 'git' 'jq')
makedepends=('git')
source=("${pkgname}::git+${url}.git#tag=v${pkgver}")
sha256sums=('29b5ed9d351ddd1c5dd7459557e363ddeb9aa6730f8fcf376210ac2fdd289405')

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
