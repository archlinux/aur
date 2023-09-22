# Maintainer: Hauke Stieler <mail@hauke-stieler.de>

pkgname=maputnik-cli
pkgver=1.7.0
pkgrel=1
pkgdesc="Maputnik-CLI for local development of Mapbox styles."
arch=('any')
url="https://github.com/maputnik/desktop"
license=('MIT')
depends=()
makedepends=('go>=1.19')
backup=()
conflicts=()
provides=('maputnik-cli=${pkgver}')

# Desktop-Repo and Editor-Repo have different versions. This builds version $pkgver.
_desktopver=1.0.7

# Currently the latest tag has no go-module. TODO use tag-specifier with next desktop release: #tag=v${_desktopver}")
source=("git+https://github.com/maputnik/desktop")
sha256sums=('SKIP')

build() {
  cd ${srcdir}

  # Make go work
  export GOPATH="$srcdir"/gopath
  export GOBIN="$GOPATH"/bin

  # Go into repo folder
  cd "desktop"
  
  # Build CLI tool. The actual editor (a web application) will be loaded automatically.
  make
}

package() {
  cd "${srcdir}/desktop"
  install -Dm755 bin/linux/maputnik "${pkgdir}"/usr/bin/maputnik
}
