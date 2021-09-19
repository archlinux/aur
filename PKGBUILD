# Maintainer: xerus <27f at pm dot me>

_pkgname='synct'
pkgname="${_pkgname}-git"
pkgver=r2.118e94a
pkgrel=2
pkgdesc='A POSIX shell client for the Syncthing REST API with personal idiosyncracies'
arch=('any')
url="https://github.com/xeruf/${_pkgname}"
license=('Unlicense')
depends=(coreutils grep curl bat)
provides=("${_pkgname}")
conflicts=("${_pkgname}")
optdepends=('git: merging with synct-diff' 'jrnl: auto-merging journal conflicts')
source=("git+${url}")
sha512sums=('SKIP')

package() {
  cd "${srcdir}/${_pkgname}/"
  bin="$pkgdir/usr/bin/"
  mkdir -p "$bin"
  cp synct* "$bin"
  sed -i "s/Usage/synct version ${pkgver}\n\0/" "$bin/synct"
}

pkgver() {
  cd "${_pkgname}"
  ( set -o pipefail
    git describe --long --tags 2>/dev/null | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g' ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  )
}
