# Maintainer: Vladimir Kosteley <zzismd@gmail.com>
_pkgname=screenshotgun
pkgname=$_pkgname-git
pkgver=88
pkgrel=1
pkgdesc="Open screenshoter with server part"
arch=(any)
url="http://screenshotgun.com"
license=('GPL')
groups=()
depends=()
makedepends=()
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
sha256sums=() #autofill using updpkgsums
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/$_pkgname"
  git rev-list HEAD --count
}

prepare() {
  cd "$srcdir/$_pkgname"
  sed -i "s/\#define VERSION \".*\"/\#define VERSION \"$pkgver\"/g" `find . -name const.h`
}

build() {
  cd "$srcdir/$_pkgname"

  qmake -config release
  make
}

package() {
  cd "$srcdir/$_pkgname"

  strip screenshotgun
  install -Dm755 "$srcdir/$_pkgname/screenshotgun" "$pkgdir/usr/bin/screenshotgun"

  install -Dm644 "$srcdir/$_pkgname/dist/screenshotgun.desktop" "$pkgdir/usr/share/applications/screenshotgun.desktop"
  install -Dm644 "$srcdir/$_pkgname/dist/screenshotgun.png" "$pkgdir/usr/share/pixmaps/screenshotgun.png"
}
