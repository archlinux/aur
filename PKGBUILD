# Maintainer: Aren <rn+aur@peacevolution.org>

pkgname=sxmobar-git
pkgver=v1.0.1.r4.50d0e5b
pkgrel=1
pkgdesc="Status bar component manager"
url="https://git.sr.ht/~stacyharper/sxmobar"
arch=('x86_64' 'aarch64')
license=('AGPL3')
depends=()
makedepends=('git' 'hare-git')
provides=('sxmobar')
conflicts=('sxmobar')
_srcname=sxmobar
source=("$_srcname::git+https://git.sr.ht/~stacyharper/sxmobar")
sha256sums=('SKIP')

pkgver() {
  cd "$_srcname"
  printf "%s" "$(git describe --long --tags | sed 's/\([^-]*-\)g/r\1/;s/-/./g')"
}

build() {
  export LDFLAGS=${LDFLAGS#'-Wl,'}
  export HARECACHE="$srcdir/.harecache"
  make -C "$_srcname"
}

package() {
  make -C "$_srcname" PREFIX="/usr" DESTDIR="$pkgdir" install
}
