# Maintainer: Alonso Herreros <alonso.herreros at gmail.com

_pkgbase="hyprcap"
pkgname="$_pkgbase-git"
pkgver=1.0.1.r0.8cb9f77
pkgrel=1
url="https://github.com/alonso-herreros/hyprcap"
pkgdesc="A utility to easily capture screenshots and recordings in Hyprland"
license=('GPL-3.0-only')
arch=('any')

depends=(
  'hyprland'
  'bash'
  'grim'
  'wf-recorder'
  'jq'
  'libnotify'
  'slurp'
  'hyprpicker' # To freeze the screen
  'wl-clipboard'
)
makedepends=(
  'git'
)

provides=("$_pkgbase")
conflicts=("$_pkgbase")

source=("$_pkgbase::git+$url")
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/$_pkgbase"
  local tag ver rev hash
  tag="$(git tag -l "v*" --sort=-v:refname | head -n1)"
  ver="${tag#v}"
  rev="$(git rev-list --count "$tag"..HEAD)"
  hash="$(git rev-parse --short HEAD)"
  printf "%s.r%s.%s" "$ver" "$rev" "$hash"
}

package() {
  cd "$srcdir/$_pkgbase"
  mkdir -p "$pkgdir/usr/bin"

  cp hyprcap "$pkgdir/usr/bin/hyprcap"
  install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$_pkgbase/LICENSE"
}
