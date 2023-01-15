# Maintainer: Stanislaw Grams <sjg@fmdx.pl>
pkgname=xdr-gtk-git
pkgver=20230115
pkgrel=1
pkgdesc="User interface for the XDR-F1HD Radio Tuner with XDR-I2C modification."
arch=('x86_64')
url="https://github.com/kkonradpl/xdr-gtk"
license=('GPL2')
depends=('gtk3')
provides=('xdr-gtk')
conflicts=('xdr-gtk')
makedepends=('git' 'cmake' 'ninja' 'pkgconf' 'gtk3')
source=("git+https://github.com/kkonradpl/xdr-gtk")
md5sums=('SKIP')
_gitname="xdr-gtk"

pkgver() {
  cd "$srcdir/$_gitname"
  git show -s --format="%ci" HEAD | sed -e 's/-//g' -e 's/ .*//'
}

build() {
  cd "$srcdir/$_gitname/build"
  cmake .. -GNinja -Wall -DCMAKE_INSTALL_PREFIX='/usr'
  ninja
}

package() {
  cd "$srcdir/$_gitname/build"
  DESTDIR="$pkgdir" ninja install
}
