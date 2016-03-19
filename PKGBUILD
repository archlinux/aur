# Maintainer: willemw <willemw12@gmail.com>

_pkgname=podget
pkgname=$_pkgname-git
pkgver=0.7.11.r0.gfedd0af
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
  git describe --long | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

package() {
  cd $pkgname

  make prefix=/usr DESTDIR="$pkgdir" changelog.gz install

  install -Dm644 README "$pkgdir/usr/share/$pkgname/README"

  cp -r SCRIPTS/ "$pkgdir/usr/share/$pkgname/scripts/"
  find "$pkgdir/usr/share/$pkgname/scripts/" -type d -exec chmod 755 '{}' \;
  find "$pkgdir/usr/share/$pkgname/scripts/" -type f -exec chmod 644 '{}' \;
}

