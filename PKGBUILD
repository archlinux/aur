# Maintainer: willemw <willemw12@gmail.com>
# Contributor: sparse

pkgname=tremc-git
pkgver=0.9.3.r63.gd8deaa5
pkgrel=1
pkgdesc='Curses interface for Transmission. Python 3 fork of transmission-remote-cli'
arch=(any)
url=https://github.com/tremc/tremc
license=(GPL3)
depends=(python)
makedepends=(git)
optdepends=('python-geoip: guess which country peers come from'
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
