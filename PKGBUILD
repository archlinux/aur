# Maintainer: Paul Jones <paul@spacefreak18.xyz>
_reponame=simapi
pkgname=simd-git
pkgver=0.1.0r94
pkgrel=1
pkgdesc="Telemetry Mapping Daemon for Racing Sims"
arch=('x86_64')
url="https://github.com/spacefreak18/simapi"
license=('GPL3')
depends=(
	argtable
	libconfig
	libxdg-basedir
	libuv
  yder
  simapi-git
)
makedepends=(
  git
  cmake
)
source=(
  git+https://github.com/spacefreak18/simapi
)
sha256sums=(
  'SKIP'
)

package() {
  cd "$srcdir/$_reponame/simd" || exit 1
  git submodule sync --recursive
  git submodule update --init --recursive
  mkdir -p build
  cd build
  export CFLAGS=-Wno-unused-result
  cmake -DCMAKE_INSTALL_PREFIX=/usr ..
  make

  mkdir -p "${pkgdir}/usr/bin/"
  cp "$srcdir/$_reponame"/simd/build/simd "${pkgdir}/usr/bin/"
}
