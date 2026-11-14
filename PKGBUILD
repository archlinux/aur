# Maintainer: Felipe BF <fprgw32 at gmail dot com>

_base=cute
_repo="${_base}_headers"
_name="${_base}_sound"

pkgname="lib${_name}-sdl2"
pkgver=r987.004c7a7
pkgrel=1
pkgdesc="Load/play/loop (with plugin)/pan WAV + OGG (stb_vorbis wrapper for OGG) in mono/stereo, high performance custom mixer, music + crossfade support (SDL2 version)"
arch=('any')
url="https://github.com/RandyGaul/${_repo}"
license=('Zlib OR Unlicense')
provides=("lib${_name}")
conflicts=("lib${_name}-git")
depends=('sdl2')
optdepends=('stb: For OGG playback support')
makedepends=('git')

source=("${_repo}::git+${url}#commit=004c7a70a71eef7b14507bb747df85d96128675c")
sha256sums=('SKIP')

pkgver() {
  cd "$_repo"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  cd "$_repo"
  install -Dm644 "${_name}.h" "$pkgdir/usr/include/${_name}.h"

  install -Dm644 <(sed -n '3458,3494p' "${_name}.h" | sed 's/^\t//g') \
    "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

