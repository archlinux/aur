# Maintainer: richard-muvirimi <tygalive at gmail dot com>
# Contributor: scrouthtv <scrouthtv 0x40 gmail 0x2e com>
# Contributor: Marcos Ferreira <merkkp at gmail dot com>

_gitname="bpkg"

pkgname="${_gitname}-git"
pkgver=1.1.3.bd8c92f
pkgrel=1
pkgdesc="Lightweight bash package manager"
arch=("any")
url="http://www.bpkg.sh/"
license=("MIT")
depends=("bash")
makedepends=("git")
provides=("${_gitname}")
conflicts=("${_gitname}")
source=("${_gitname}::git+https://github.com/${_gitname}/${_gitname}")
md5sums=("SKIP")

pkgver() {
  cd "${_gitname}"

  TAG="$(git describe --tags $(git rev-list --tags --max-count=1) | sed 's/-/.r/;s/-/./')"
  HASH="$(git describe --tags --long --always | sed 's/\([^-]*-g\)/r\1/;s/-/./g')"

  # Outputs something like: 1.1.3.bd8c92f
  echo "$TAG.$HASH"
}

build(){
  cd "${srcdir}/${_gitname}"

  # Check out latest tag
  git fetch --tags
  git checkout "$(git describe --tags $(git rev-list --tags --max-count=1))"
}

package() {
  cd "${srcdir}/${_gitname}"

  PREFIX="${pkgdir}/usr" ./setup.sh
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

# vim:set ts=2 sw=2 et:
