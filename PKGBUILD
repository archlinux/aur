# Maintainer: Paul Jones <paul@spacefreak18.xyz>
_reponame=simmonitor
pkgname=simmonitor-git
pkgrel=1
pkgver=v1.0
pkgdesc="Dashboards and Telemetry Monitoring for Racing Sims"
arch=('x86_64')
url="https://github.com/spacefreak18/simmonitor"
license=('GPL3')

depends=(
  argtable
  libconfig
  libxdg-basedir
  libuv
  ncurses
  libmicrohttpd
  hoel
  sdl2
  sdl2_image
  postgresql-libs
  mariadb-libs
  sqlite3
  libtar
)

makedepends=(
  git
  cmake
  make
  gcc
)

sha256sums=(
  'SKIP'
)

source=("git+https://github.com/spacefreak18/simmonitor.git")

package() {
  cd "$srcdir/$_reponame" || exit 1
  git submodule sync --recursive
  git submodule update --init --recursive
  mkdir -p build
  cd build
  export CFLAGS=-Wno-unused-result
  cmake ..
  make
  mkdir -p "${pkgdir}/usr/bin/"
  cp "$srcdir/$_reponame"/build/simmonitor "${pkgdir}/usr/bin/simmonitor"
  install -D -m644 "$srcdir/$_reponame"/LICENSE.rst -t "${pkgdir}/usr/share/licenses/$_reponame"
}
