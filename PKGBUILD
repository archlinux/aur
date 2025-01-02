# Maintainer:

_pkgname="discimagecreator"
pkgname="$_pkgname-git"
pkgver=20250101.r0.g5126ba5
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

provides=("$_pkgname=${pkgver%%.r*}")
conflicts=("$_pkgname")

_pkgsrc="$_pkgname"
source=("$_pkgsrc"::"git+$url.git")
sha256sums=('SKIP')

pkgver() {
  cd "$_pkgsrc"
  git describe --long --tags --abbrev=7 --exclude='*[a-zA-Z][a-zA-Z]*' \
    | sed -E 's/^[^0-9]*//;s/([^-]*-g)/r\1/;s/-/./g'
}

build() {
  arch-meson build "$_pkgsrc"
  meson compile -C build
}

package() {
  meson install -C build --destdir "$pkgdir"
}
