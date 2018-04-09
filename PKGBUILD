# Maintainer: Vladimir Kosteley <zzismd@gmail.com>
_pkgname=screenshotgun
pkgname=$_pkgname-git
pkgver=0.17_20180409_1
pkgrel=1
pkgdesc="Open cross-platform screenshoter with cloud support and server part"
arch=(any)
url="http://screenshotgun.com"
license=('GPL')
groups=()
depends=('qt5-base')
makedepends=('git' 'cmake>=3.3')
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=("$_pkgname::git+https://github.com/ismd/screenshotgun.git")
noextract=()
sha256sums=()
md5sums=('SKIP')

prepare() {
  cd "$srcdir/$_pkgname"
  git checkout tags/v0.17-20180409-1
}

build() {
  mkdir "$srcdir/build-$_pkgname"
  cd "$srcdir/build-$_pkgname"

  cmake "$srcdir/$_pkgname" -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX=/usr
  cmake --build .
}

package() {
  cd "$srcdir/build-$_pkgname"
  make DESTDIR="$pkgdir/" install/strip
}
