# Maintainer:
# Contributor: Łaurent ʘ❢Ŧ Ŧough <laurent dot fough at gmail dot com>

_pkgname="termv"
pkgname="$_pkgname-git"
pkgver=1.4.r0.g0b7468d
pkgrel=1
pkgdesc="A terminal iptv player written in bash"
url="https://github.com/Roshan-R/termv"
arch=('any')
license=('GPL-3.0-only')

depends=(
  'bash'
  'curl'
  'fzf'
  'gawk'
  'jq'
  'mpv'
  'xdo'
)
makedepends=('git')

provides=("$_pkgname=${pkgver%%.r*}")
conflicts=("$_pkgname")

_pkgsrc="$_pkgname"
source=("$_pkgsrc"::"git+$url.git")
sha256sums=('SKIP')

pkgver() {
  cd "$_pkgsrc"
  git describe --long --tags --abbrev=7 --match='v[0-9]*' --exclude='*[a-zA-Z][a-zA-Z]*' --exclude='v.*' \
    | sed -E 's/^[^0-9]*//;s/([^-]*-g)/r\1/;s/-/./g'
}

package() {
  cd "$_pkgsrc"
  install -Dm775 termv -t "$pkgdir/usr/bin/"
}
