# Maintainer: Sebastian Reuße <seb@wirrsal.net>
pkgname=extendp-git
_gitname=extendp
pkgver=r17.235677e
pkgrel=1
pkgdesc="A wildcard command for shell pipelines."
arch=(i686 x86_64)
url="https://github.com/jkarni/extendp"
license=(unknown)
source=(git+https://github.com/jkarni/extendp)
depends=(glib2)
provides=(extendp)
conflicts=(extendp)
makedepends=(git)
md5sums=(SKIP)
install=extendp.install

pkgver() {
  cd "$_gitname"
  commit=$(git rev-list --count master)
  hash=$(git rev-parse --short HEAD)
  echo "r$commit.$hash"
}

build() {
  cd "$_gitname"
  make
}

package() {
  cd "$_gitname"
  echo $pkgdir
  install -Dm 755 xp "$pkgdir"/usr/bin/xp
  install -Dm 644 xp.1 "$pkgdir"/usr/share/man/man1/xp.1
  install -Dm 644 extendp.cfg "$pkgdir"/usr/share/extendp/extendp.cfg
}
