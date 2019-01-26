# Maintainer: Jonathan Knapp <jaknapp8+aur@gmail.com>
# URL: https://codeparade.itch.io/marblemarcher
# Upstream: https://github.com/HackerPoet/MarbleMarcher

pkgname=marble-marcher-git
pkgver=0.0.0.g8503931
pkgrel=1
pkgdesc='A Fractal Physics Game.'
arch=('i686' 'x86_64')
url='https://codeparade.itch.io/marblemarcher'
license=('GPL2')
depends=('eigen' 'sfml')
makedepends=('git' 'cmake' 'gcc')
provides=('marble-marcher')
conflicts=('marble-marcher')
source=("$pkgname::git+https://github.com/HackerPoet/MarbleMarcher.git")
md5sums=('SKIP')

pkgver() {
  cd $pkgname
  #git describe --tags --always | sed 's/^v//;s/-/./g'
  echo 0.0.0.g$(git describe --tags --always | sed 's/^v//;s/-/./g')
}

package() {
  cd "$pkgname"
  cmake .
  cmake --build .
  mkdir -p "$pkgdir/usr/share/$pkgname"
  cp -r assets "$pkgdir/usr/share/$pkgname"
  install -D -m755 MarbleMarcher "$pkgdir/usr/share/$pkgname/MarbleMarcher"
  mkdir -p  "$pkgdir/usr/bin"
  cat <<EOF > "$pkgdir/usr/bin/MarbleMarcher"
#!/bin/sh
cd "/usr/share/$pkgname"
./MarbleMarcher
EOF
  chmod 755  "$pkgdir/usr/bin/MarbleMarcher"
}
