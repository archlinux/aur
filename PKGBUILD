# Contributor: sekret, mail=$(echo c2VrcmV0QHBvc3Rlby5zZQo= | base64 -d)

pkgname=ratox-git
_pkgname=${pkgname%-git}
pkgver=0.4.r21.g73bdc88
pkgrel=1
pkgdesc="FIFO based tox client"
arch=('i686' 'x86_64')
url="https://github.com/pranomostro/ratox"
license=('custom')
depends=('toxcore')
makedepends=('git')
provides=("$_pkgname")
conflicts=("$_pkgname")
source=("git+$url")
sha256sums=('SKIP')

pkgver() {
  cd "$_pkgname"
  git describe --long --tags | sed -e 's/^v//;s/-/.r/;s/-/./g'
}

build() {
  cd "$_pkgname"
  make
}

package() {
  cd "$_pkgname"
  make DESTDIR="$pkgdir" PREFIX=/usr install
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

# vim:set ts=2 sw=2 et:
