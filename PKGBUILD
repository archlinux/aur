# Maintainer:

_pkgname="xfs_undelete"
pkgname="$_pkgname-git"
pkgdesc='An undelete tool for the XFS filesystem'

pkgver=12.1.r0.g9e2f7ab
pkgrel=1

arch=('any')
license=('GPL3')
url="https://github.com/ianka/xfs_undelete"

depends=()
makedepends=()

provides=("$_pkgname")
conflicts=(${provides[@]})

source=(
  "git+$url"
)
sha256sums=(
  'SKIP'
)

pkgver() {
  cd "$srcdir/$_pkgname"
  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

package() {
  depends+=(
    'tcl'

    # AUR
    'tcllib'
  )

  cd "$srcdir/$_pkgname"

  install -Dm0755 "xfs_undelete" -t "$pkgdir/usr/bin"
  install -Dm0644 "xfs_undelete.man" "$pkgdir/usr/share/man/man1/xfs_undelete.1"
}

