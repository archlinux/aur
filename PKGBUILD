# Maintainer: xiota / aur.chaotic.cx

_pkgname="xfs_undelete"
pkgname="$_pkgname-git"
pkgver=14.0.r0.gc311722
pkgrel=1
pkgdesc='Undelete tool for the XFS filesystem'
url="https://github.com/ianka/xfs_undelete"
license=('GPL-3.0-only')
arch=('any')

depends=()
makedepends=('git')

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

package() {
  depends+=(
    'tcl'

    # AUR
    'tcllib'
  )

  cd "$_pkgsrc"
  install -Dm755 "xfs_undelete" -t "$pkgdir/usr/bin/"
  install -Dm644 "xfs_undelete.man" "$pkgdir/usr/share/man/man1/xfs_undelete.1"
}
