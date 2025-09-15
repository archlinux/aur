# Maintainer:
# Contributor: Sematre <sematre at gmx dot de>

_pkgname="discimagecreator"
pkgname="$_pkgname"
pkgver=20250901
pkgrel=1
pkgdesc="A disk image creation tool supporting a large number of formats"
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
sha256sums=('e74970ab1009b69384e722f08b71df478533f5757ccb9a1b8c200bfdb628b290')

build() {
  arch-meson build "$_pkgsrc"
  meson compile -C build
}

package() {
  meson install -C build --destdir "$pkgdir"
}
