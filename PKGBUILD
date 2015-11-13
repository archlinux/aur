# Maintainer: willemw <willemw12@gmail.com>

_pkgname=podget
pkgname=$_pkgname-git
pkgver=r2.8b92d8b
pkgrel=1
pkgdesc="Simple tool to automate downloading of podcasts"
arch=('any')
url="https://github.com/dvehrs/podget"
license=('GPL3')
makedepends=('git')
depends=('wget')
provides=($_pkgname)
conflicts=($_pkgname)
source=($pkgname::git://github.com/dvehrs/podget.git)
md5sums=('SKIP')

pkgver() {
  cd "$pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  cd $pkgname
  make prefix=/usr DESTDIR="$pkgdir" changelog.gz install
  install -Dm644 README "$pkgdir/usr/share/$pkgname/README"
  cp -a SCRIPTS/ "$pkgdir/usr/share/$pkgname/scripts/"
  find "$pkgdir/usr/share/$pkgname/scripts/" -type d -exec chmod 755 '{}' \;
}

