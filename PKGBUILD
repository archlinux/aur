# Maintainer: xerus <27f at pm dot me>

_pkgbasename='synct'
pkgname="${_pkgbasename}-git"
pkgver=r2.118e94a
pkgrel=1
pkgdesc='A POSIX shell client for the Syncthing REST API with personal idiosyncracies'
arch=('any')
url="https://github.com/xeruf/${_pkgbasename}"
license=('Unlicense')
optdepends=('git: merging with synct-diff' 'jrnl: auto-merging journal conflicts')
depends=(coreutils grep curl bat)
provides=("${_pkgbasename}")
conflicts=("${_pkgbasename}")
optdepends=('')
source=("git+${url}")
sha512sums=('SKIP')

package() {
  cd "${srcdir}/${_pkgbasename}/"
  sudo cp synct* /usr/bin/
  sudo sed -i "s/Usage/synct version ${pkgver}\n\0/" /usr/bin/synct
}

pkgver() {
  cd "${_pkgbasename}"
  ( set -o pipefail
    git describe --long --tags 2>/dev/null | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g' ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  )
}
