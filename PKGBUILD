# Maintainer: Moritz Lipp <mlq@pwmt.org>

_pkgname=girara

pkgname=girara-git
pkgver=0.3.4.r3.g92409d1
pkgrel=1
pkgdesc="user interface library"
arch=('i686' 'x86_64')
url="http://pwmt.org/projects/girara"
license=('custom')
depends=('gtk3>=3.2' 'glib2>=2.28' 'intltool')
makedepends=('git' 'meson')
conflicts=('girara')
provides=('girara')
source=("${_pkgname}::git+https://git.pwmt.org/pwmt/girara.git#branch=develop")
md5sums=('SKIP')

prepare() {
  mkdir -p build
}

build() {
  cd build
  meson --prefix=/usr --buildtype=release $srcdir/$_pkgname
  ninja
}

package() {
  cd build
  DESTDIR="$pkgdir/" ninja install
}

pkgver() {
  cd "$_pkgname"
  git describe --long | sed -r 's/([^-]*-g)/r\1/;s/-/./g'
}

# vim:set ts=2 sw=2 et:
