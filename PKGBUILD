# Maintainer: willemw <willemw12@gmail.com>

pkgname=podget-git
pkgver=0.8.8.r20.g750fa49
pkgrel=1
pkgdesc="Simple tool to automate downloading of podcasts"
arch=('any')
url="https://github.com/dvehrs/podget"
license=('GPL3')
makedepends=('git')
depends=('wget')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=($pkgname::git+$url.git)
sha256sums=('SKIP')

pkgver() {
  git -C $pkgname describe --long | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

package() {
  install -Dm644 $pkgname/README -t "$pkgdir/usr/share/${pkgname%-git}"
  cp -a $pkgname/SCRIPTS/ "$pkgdir/usr/share/${pkgname%-git}/scripts/"

  make -C $pkgname prefix=/usr DESTDIR="$pkgdir/" changelog.gz install
}

