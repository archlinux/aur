# Maintainer:
# Contributor: Sematre <sematre at gmx dot de>

_pkgname="discimagecreator"
pkgname="$_pkgname"
pkgver=20260101
pkgrel=1
pkgdesc="A disk image creation tool supporting a large number of formats"
url="https://github.com/saramibreak/DiscImageCreator"
license=('Apache-2.0')
arch=('x86_64')

depends=(
  'libarchive'
  'openssl'
  'zlib'
)
makedepends=(
  'git'
  'meson'
  'ninja'
)
optdepends=(
  'unscrambler: Unscramble GC/Wii optical disks'
)

_pkgsrc="DiscImageCreator-$pkgver"
_pkgext="tar.gz"
source=("$_pkgname-$pkgver.$_pkgext"::"$url/archive/refs/tags/$pkgver.$_pkgext")
sha256sums=('bfb5e2917deb5a3b1e7d52233cd82eba0402294ed06b1c0c77620317bb1153c4')

build() {
  arch-meson build "$_pkgsrc"
  meson compile -C build
}

package() {
  meson install -C build --destdir "$pkgdir"
}
