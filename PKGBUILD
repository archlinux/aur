# Maintainer: Vladimir Kosteley <zzismd@gmail.com>
_pkgname=screenshotgun
pkgname=$_pkgname-git
pkgver=0.21_20210623_1
pkgrel=1
pkgdesc="Open cross-platform screenshoter with cloud support and server part"
arch=(any)
url="http://screenshotgun.com"
license=('GPL')
groups=()
depends=('qt5-base')
makedepends=('cmake>=3.5.1' 'git')
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=("$_pkgname::git+https://github.com/ismd/screenshotgun.git#tag=v0.21-20210623-1")
noextract=()
sha256sums=()
md5sums=('SKIP')

prepare() {
  cd "$srcdir/$_pkgname"
  git checkout tags/v0.21-20210623-1
}

build() {
  mkdir "$srcdir/build-$_pkgname"
  cd "$srcdir/build-$_pkgname"

  cmake -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX=/usr "$srcdir/$_pkgname"
  cmake --build .
}

package() {
  cd "$srcdir/build-$_pkgname"
  make DESTDIR="$pkgdir/" install/strip
}
