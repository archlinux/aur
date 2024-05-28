# Maintainer:  dreieck
# Contributor: zfo <zfoofz1 at gmail dot com>
# Contributor: megadriver <megadriver at gmx dot com>
# Contributor: Roman Timushev <rtimush@gmail.com>

pkgname=mc-solarized-git
_gitname=mc-solarized-skin
epoch=1
pkgver=r2.20120123.cd9eddb
pkgrel=2
pkgdesc="Solarized color scheme for Midnight Commander"
arch=('any')
url="https://github.com/nkulikov/mc-solarized-skin"
license=('LicenseRef-unknown')
depends=('mc')
makedepends=('git')
provides=(
  "mc-solarized"
  "${_gitname}"
)
conflicts=(
  "mc-solarized"
  "${_gitname}"
)
source=("$_gitname::git+https://github.com/nkulikov/$_gitname.git")
md5sums=('SKIP')

pkgver() {
  cd "$_gitname"

  _rev="$(git rev-list --count HEAD)"
  _date="$(git log -1 --date=format:"%Y%m%d" --format="%ad")"
  _hash="$(git rev-parse --short HEAD)"

  if [ -z "${_rev}" ]; then
    error "Could not determine git commit count."
    return 1
  else
    printf '%s' "r${_rev}.${_date}.${_hash}"
  fi
}

package() {
  cd "$_gitname"
  install -D -m644 solarized.ini "$pkgdir/usr/share/mc/skins/solarized.ini"
}
