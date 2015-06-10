# Maintainer: Buce <dmbuce@gmail.com>
# Contributor: ssc <chasessc@gmail.com>

pkgname=minecraft-region-fixer
pkgver=0.1.1
pkgrel=2
pkgdesc="Tries to fix Minecraft worlds (or region files)."
arch=('i686' 'x86_64')
url="https://github.com/Fenixin/Minecraft-Region-Fixer"
license=('GPL')
depends=('python2')
makedepends=('git')
source=("$pkgname::git://github.com/Fenixin/Minecraft-Region-Fixer.git#tag=v$pkgver")
md5sums=('SKIP')

prepare() {
  cd "$srcdir/$pkgname"
  sed -i '1 s|python|python2|g' region-fixer.py
  chmod +x region-fixer.py
}

#build() {
#  cd "$srcdir/$pkgname"
#}

package() {
  cd "$srcdir/$pkgname"

  _installdir="usr/lib/python$(python2 --version 2>&1 | grep -o '2\.[0-9]*')/site-packages/${pkgname%-git}"
  mkdir -p "$pkgdir/$_installdir"
  cp -r * "$pkgdir/$_installdir"

  mkdir -p "$pkgdir/usr/bin"
  ln -s "/$_installdir/region-fixer.py" "$pkgdir/usr/bin/region-fixer"
} 

# vim:set ts=2 sw=2 et:
