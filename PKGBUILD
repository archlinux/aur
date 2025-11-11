# Maintainer: willemw <willemw12@gmail.com>
# Contributor: sparse

pkgname=tremc-git
pkgver=0.9.5.r0.g19592ce
pkgrel=1
pkgdesc='Curses interface client for Transmission'
arch=(any)
url=https://github.com/tremc/tremc
license=(GPL-3.0-or-later)
depends=(python)
makedepends=(git)
optdepends=(
  'python-geoip: guess which country peers come from'
  'python-geoip2: guess which country peers come from'
  'python-pyperclip: copy magnet links to the system clipboard')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=("$pkgname::git+$url.git")
sha256sums=('SKIP')

pkgver() {
  git -C $pkgname describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

package() {
  install -Dm644 $pkgname/settings.cfg -t "$pkgdir/usr/share/${pkgname%-git}"
  make -C $pkgname PREFIX=/usr DESTDIR="$pkgdir" install
}
