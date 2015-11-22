# Maintainer: Kohei Suzuki <eagletmt@gmail.com>
pkgname=pt3_drv-dkms-git
_pkgname=pt3_drv
pkgver=r101.3e315b5
pkgrel=1
pkgdesc="PT3 driver sources for DKMS"
arch=('i686' 'x86_64')
url="https://github.com/m-tsudo/pt3"
license=('GPL')
depends=('dkms' 'linux-headers')
makedepends=('git')
provides=('pt3_drv-dkms')
install=dkms.install
source=("$pkgname"::'git+https://github.com/m-tsudo/pt3'
        remove-make-dkms.patch
        99-pt3_drv.rules)

pkgver() {
  cd "$srcdir/$pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  cd "$srcdir/$pkgname"
  patch -Np1 -i "$srcdir/remove-make-dkms.patch"
}

build() {
  :
}

package() {
  cd "$srcdir/$pkgname"

  install -dm755 "$pkgdir/usr/src/$_pkgname-$pkgver"
  install -m644 *.{c,h} Makefile dkms.conf "$pkgdir/usr/src/$_pkgname-$pkgver/"
  install -Dm644 "$srcdir/99-pt3_drv.rules" "$pkgdir/usr/lib/udev/rules.d/99-pt3_drv.rules"
  install -Dm644 COPYING "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

# vim:set ts=2 sw=2 et:
sha1sums=('SKIP'
          '7632bc7217c4414f202afe681780541eb58149f7'
          '89f86e04814e0a85dc9b1ffda9a440b833237a3b')
