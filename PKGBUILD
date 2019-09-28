# Maintainer: timescam <rex.ky.ng@gmail.com>

_pkgname=polybar-spotify
pkgname=${_pkgname}-git
pkgver=r32.50cfd6b
pkgrel=1
pkgdesc='This is a module that shows the current song playing and its primary artist on Spotify.'
arch=('x86_64')
url=https://github.com/Jvanrhijn/${_pkgname}
license=('MIT')
makedepends=(git)
depends=('python' 'python-dbus')
source=("${_pkgname}::git+${url}.git")
sha256sums=('SKIP')

pkgver() {
  cd ${_pkgname}
  set -o pipefail
  git describe --long 2> /dev/null | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g' ||
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  cd ${_pkgname}
  install -Dm644 README.md "${pkgdir}"/usr/share/doc/${_pkgname}/README.md
  install -Dm644 LICENSE "${pkgdir}"/usr/share/licenses/${_pkgname}/LICENSE
  install -Dm755 spotify_status.py "${pkgdir}"/usr/share/polybar/scripts/spotify_status.py
}