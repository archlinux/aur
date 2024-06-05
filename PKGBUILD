# Maintainer:
# Contributor: sekret

## useful links:
# https://sourceforge.net/projects/lossywav/
# https://github.com/MoSal/lossywav-for-posix

_pkgname="lossywav"
pkgname="$_pkgname-git"
pkgver=1.4.2p.r21.g5c04ba3
pkgrel=1
pkgdesc="lossy audio pre-processor to improve flac encoding efficiency"
url="https://github.com/xiota/lossywav-for-posix"
arch=('i686' 'x86_64' 'armv6h' 'armv7h')
license=('GPL-3.0-or-later')

depends=(
  'fftw'
)
makedepends=(
  'git'
  'meson'
  'ninja'
)

provides=("$_pkgname")
conflicts=("$_pkgname")

_pkgsrc="$_pkgname"
source=("$_pkgname::git+$url.git")
sha256sums=('SKIP')

pkgver() {
  cd "$_pkgsrc"
  git describe --tag --long --abbrev=7 \
    | sed -r 's/([^-]*-g)/r\1/;s/-/./g'
}

build() {
  arch-meson build "$_pkgsrc"
  meson compile -C build
}

package() {
  meson install -C build --destdir "$pkgdir"
}
