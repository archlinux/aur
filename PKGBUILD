# Maintainer:
# Contributor: Sematre <sematre at gmx dot de>

_pkgname="discimagecreator"
pkgname="$_pkgname"
pkgver=20250101
pkgrel=1
pkgdesc="A disk image creation tool supporting CD, GD, DVD, BD, GC/Wii, Xbox, floppy, MO, USB, etc"
url="https://github.com/saramibreak/DiscImageCreator"
license=('Apache-2.0')
arch=('x86_64')

depends=(
  'gcc-libs'
  'glibc'
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
sha256sums=('5cc3688557cd9a3d9f99d7bc770ee2750cf81c5eebd1e8493f9acea960465601')

build() {
  arch-meson build "$_pkgsrc"
  meson compile -C build
}

package() {
  meson install -C build --destdir "$pkgdir"
}
