# Maintainer: Tim Jester-Pfadt <t.jp@gmx.de>

pkgname=apitest-git
pkgver=122.cde1d33
pkgrel=4
pkgdesc="Simple comparison framework for graphics APIs"
arch=('i686' 'x86_64')
url="https://github.com/nvMcJohn/apitest"
license=('Unlicense')
makedepends=('cmake')
install=$pkgname.install
source=('git+https://github.com/nvMcJohn/apitest.git' )
sha256sums=('SKIP')

build() {
  cd "$srcdir"/apitest
  mkdir _out
  cd _out
  cmake -G "Unix Makefiles" -DHAVE_LIBUDEV_H=0  ..
  make
}

package() {
  cd "$srcdir"/apitest
  mkdir -p "$pkgdir"/opt/apitest
  cd bin
  cp -R * "$pkgdir"/opt/apitest
  chown -R 755 "$pkgdir"/opt/apitest
  cd ..
  install -Dm755 LICENSE "$pkgdir"/usr/share/licenses/apitest/LICENSE
}

pkgver() {
  cd "$srcdir"/apitest
  echo $(git rev-list --count master).$(git rev-parse --short master)
}
