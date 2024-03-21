# Maintainer: 
pkgname=wayscreen
pkgver=1.0.0
pkgrel=1
pkgdesc="A simple screenshot app running under Wayland"
arch=(any)
url="https://github.com/yarchefis/wayscreen"
license=('')
depends=(python python-pyscreenshot tk python-pillow)
makedepends=(python)
source=("wayscreen::git+https://github.com/yarchefis/wayscreen.git")
md5sums=('SKIP')

build() {
  cd "wayscreen/"

  sed -i -e 's\if __name__ == "__main__"\def main()\g' main.py
  echo "
if __name__ == \"__main__\":
    main()
" >> main.py

}

package() {
  cd "wayscreen/"


  mkdir -p "$pkgdir/opt/wayscreen"
  cp *.py "$pkgdir/opt/wayscreen"


  mkdir -p "$pkgdir/usr/bin"
  echo "#!/usr/bin/env python3
import sys
sys.path.append(\"/opt/wayscreen\")

from main import main
main()
" > "$pkgdir/usr/bin/wayscreen"


  chmod 755 "$pkgdir/usr/bin/wayscreen"
}
