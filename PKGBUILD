# Maintainer: Liam Greenough <beacon515@gmail.com>
# Contributer: Limao Luo <luolimao+AUR@gmail.com>

pkgname=ly2video-git
pkgver=0.4.1
pkgrel=1
pkgdesc="A script to generate a video from a Lilypond sheet music file"
provides=(ly2video)
conflicts=(ly2video)
arch=(any)
url=https://github.com/aspiers/ly2video
license=(GPL3)
depends=(ffmpeg 'lilypond>=2.15.41' python2-imaging python2-midi python2-pypdf python2-pip timidity++)
makedepends=(git)
source=('ly2video::git+https://github.com/aspiers/ly2video.git')
md5sums=('SKIP')
build() {
    cd ly2video
    python2 setup.py build
}

package() {
    cd ly2video
    python2 setup.py install --root="$pkgdir" --optimize=1
}

pkgver() {
  cd ly2video
  ( set -o pipefail
    git describe --long 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  )
}
