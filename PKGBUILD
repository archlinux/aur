# Maintainer: n0vember <n0vember at half-9 dot net>
pkgname=dracut-antievilmaid
pkgver=3.0.4
pkgrel=1
pkgdesc="Dracut module and conf file to enable Anti Evil Maid support."
arch=('i686' 'x86_64')
url="http://www.qubes-os.org"
license=('GPL')
depends=('dracut' 'trousers')
makedepends=('git')
optdepends=("antievilmaid: Anti Evil Maid installation script")
provides=('dracut-antievilmaid')
conflicts=('dracut-antievilmaid')
source=('git://github.com/QubesOS/qubes-antievilmaid')
_srcdir=qubes-antievilmaid
sha256sums=('SKIP')

build() {
  cd "$_srcdir"
  git checkout tags/v$pkgver -b v$pkgver
}

package() {
  cd "$_srcdir"

  install -D -m0644 anti-evil-maid/etc/dracut.conf.d/anti-evil-maid.conf \
    "$pkgdir/etc/dracut.conf.d/anti-evil-maid.conf"

  install -d -m0755 "$pkgdir/usr/lib/dracut/modules.d"
  cp -r anti-evil-maid/90anti-evil-maid \
    "$pkgdir/usr/lib/dracut/modules.d/"
}

# vim:set ts=2 sw=2 et:
