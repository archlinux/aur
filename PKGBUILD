pkgname=rjumen-git
pkgver=r5.c2b157f
pkgrel=1
pkgdesc="GUI currency converter"
arch=('any')
url="https://github.com/rjumen-git/rjumen"
license=('MIT')
depends=('python' 'python-pyqt5') # замени на python-pyside6 если используешь её
makedepends=('git')
source=("git+https://github.com/rjumen-git/rjumen.git")
md5sums=('SKIP')

pkgver() {
  cd rjumen
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  cd "$srcdir/rjumen"

  install -d "$pkgdir/usr/lib/rjumen"
  install -d "$pkgdir/usr/bin"
  install -d "$pkgdir/usr/share/applications"
  install -d "$pkgdir/usr/share/pixmaps"

  cp *.py "$pkgdir/usr/lib/rjumen/"

  install -Dm644 "$srcdir/../rjumen.desktop" "$pkgdir/usr/share/applications/rjumen.desktop"
  

  install -Dm644 "money.png" "$pkgdir/usr/share/pixmaps/rjumen.png"


  echo '#!/bin/sh' > "$pkgdir/usr/bin/rjumen"
  echo 'export PYTHONPATH=$PYTHONPATH:/usr/lib/rjumen' >> "$pkgdir/usr/bin/rjumen"
  echo 'cd /usr/lib/rjumen && python main.py "$@"' >> "$pkgdir/usr/bin/rjumen"
  
  chmod 755 "$pkgdir/usr/bin/rjumen"
}