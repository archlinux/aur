# Contributor: Daniel Wallace <danielwallace at gtmanfred dot com>
# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>
# Maintainer: Nebulosa  <nebulosa2007-at-yandex-dot-ru>

pkgname=reptyr-git
pkgver=0.10.0.r5.ge294304
pkgrel=1
pkgdesc="Reparent a running program to a new terminal"
arch=(x86_64)
url="https://github.com/nelhage/${pkgname%-git}"
license=(MIT)
depends=(glibc)
makedepends=(git)
provides=(${pkgname%-git})
conflicts=(${pkgname%-git})
options=(!debug)
source=("${pkgname%-git}::git+$url.git")
b2sums=('SKIP')

pkgver() {
  git -C ${pkgname%-git} describe --long --tags --abbrev=7 | sed "s/\([^-]*-g\)/r\1/;s/-/./g;s/^${pkgname%-git}.//"
}

build() {
  cd ${pkgname%-git}
  make
}

package() {
  cd ${pkgname%-git}
  make "DESTDIR=$pkgdir" "PREFIX=/usr" install
  install -vDm 644 COPYING "$pkgdir"/usr/share/licenses/${pkgname%-git}/LICENSE
}
