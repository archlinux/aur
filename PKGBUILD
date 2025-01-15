# Maintainer: Paul Jones <paul@spacefreak18.xyz>
_reponame=monocoque
pkgname=monocoque
pkgver=0.2.0
pkgrel=4
pkgdesc="Device Manager for Racing Sims"
arch=('x86_64')
url="https://github.com/spacefreak18/monocoque"
license=('GPL3')
_commit=12509e9709871afcb3ae264823b4a7d3c3b71bf7
depends=(
        hidapi
	libserialport
	libxml2
	argtable
	libconfig
	libpulse
	libxdg-basedir
	libuv
)
makedepends=(
  git
  cmake
)

source=("git+https://github.com/spacefreak18/monocoque.git#commit=$_commit")

sha256sums=(
  'SKIP'
)

package() {
  cd "$srcdir/$_reponame" || exit 1
  git submodule sync --recursive
  git submodule update --init --recursive
  mkdir -p build
  cd build
  cmake -Wno-dev -DUSE_PULSEAUDIO=yes ..
  make

  mkdir -p "${pkgdir}/usr/bin/"
  cp "$srcdir/$_reponame"/build/monocoque "${pkgdir}/usr/bin/monocoque"
  install -D -m644 "$srcdir/$_reponame"/LICENSE.rst -t "${pkgdir}/usr/share/licenses/$_reponame"
}
