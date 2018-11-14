# Maintainer: Brent Carmer <bcarmer@gmail.com>
pkgname=saw-script-git
_pkgname=saw-script

pkgver=ef1f6549
pkgver() {
    cd "$_pkgname"
    git describe --long --tags --always | sed -r 's/([^-]*-g)/r\1/;s/-/./g'
}

pkgrel=1
pkgdesc="The SAW scripting language."
url="http://saw.galois.com/"
arch=('x86_64')
license=('noncommercial')
depends=('ncurses' 'z3')
makedepends=('stack' 'perl')
optdepends=()
conflicts=()
replaces=()
backup=()
conflicts=('saw-script')
provides=('saw-script')
md5sums=('SKIP')

source=('git://github.com/GaloisInc/saw-script.git')

build() {
  cd "$srcdir/${_pkgname}"
  ln -sf stack.ghc-8.4.yaml stack.yaml
  ./build.sh
}

package() {
  cd "$srcdir/$_pkgname"
  mkdir -p $pkgdir/usr/bin
  mkdir -p $pkgdir/usr/share/licenses/$_pkgname
  cp bin/saw $pkgdir/usr/bin
  cp LICENSE $pkgdir/usr/share/licenses/$_pkgname
}
