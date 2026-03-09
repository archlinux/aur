pkgname=rjumen-git
pkgver=6.0
pkgrel=1
pkgdesc="GUI currency converter"
arch=('any')
url="https://github.com/rjumen-git/rjumen"
license=('MIT')
depends=('python' 'python-pyqt6' 'python-requests') 
makedepends=('git')
source=("git+https://github.com/rjumen-git/rjumen.git"
        "rjumen.desktop")
md5sums=('SKIP' 'SKIP')

pkgver() {
  cd rjumen
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  cd "$srcdir/rjumen"
  install -d "$pkgdir/usr/lib/rjumen"
  cp *.py "$pkgdir/usr/lib/rjumen/"

  install -d "$pkgdir/usr/share/pixmaps"
  install -m644 "money.png" "$pkgdir/usr/share/pixmaps/rjumen.png"

  install -d "$pkgdir/usr/share/applications"
  install -m644 "$srcdir/rjumen.desktop" "$pkgdir/usr/share/applications/rjumen.desktop"

  install -d "$pkgdir/usr/bin"
  echo '#!/bin/sh' > "$pkgdir/usr/bin/rjumen"
  echo 'export PYTHONPATH=$PYTHONPATH:/usr/lib/rjumen' >> "$pkgdir/usr/bin/rjumen"
  echo 'cd /usr/lib/rjumen && python main.py "$@"' >> "$pkgdir/usr/bin/rjumen"
  
  chmod 755 "$pkgdir/usr/bin/rjumen"
}
