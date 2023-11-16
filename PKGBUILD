# Maintainer: xiota / aur.chaotic.cx

_pkgname="xfs_undelete"
pkgname="$_pkgname-git"
pkgdesc='Undelete tool for the XFS filesystem'

pkgver=12.1.r0.g9e2f7ab
pkgrel=2

arch=('any')
license=('GPL3')
url="https://github.com/ianka/xfs_undelete"

depends=()
makedepends=('git')

provides=("$_pkgname=${pkgver%%.r*}")
conflicts=("$_pkgname")

_pkgsrc="$_pkgname"
source=("$_pkgsrc"::"git+$url.git")
sha256sums=('SKIP')

pkgver() {
  cd "$_pkgsrc"
  git describe --long --tags --exclude='*[a-zA-Z][a-zA-Z]*' 2>/dev/null \
    | sed -E 's/^v//;s/([^-]*-g)/r\1/;s/-/./g'
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

