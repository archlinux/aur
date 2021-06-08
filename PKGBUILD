# Maintainer: redtide <redtid3@gmail.com>
# Contributor: Liam Greenough <beacon515@gmail.com>
# Contributor: Limao Luo <luolimao+AUR@gmail.com>

pkgname_=ly2video
pkgname=${pkgname_}-git
pkgver=r429.c63cc1b
pkgrel=1
pkgdesc="A script to generate a video from a Lilypond sheet music file"
provides=('ly2video')
conflicts=('ly2video')
arch=('any')
url="https://github.com/aspiers/ly2video"
license=('GPL3')
depends=('ffmpeg' 'lilypond>=2.15.41' 'python-midi' 'python-pexpect' 'python-pillow' 'python-pip' 'timidity++')
makedepends=('git')
source=('ly2video::git+https://github.com/aspiers/ly2video.git')
sha512sums=('SKIP')
build() {
    cd "${srcdir}/${pkgname_}"
    python3 setup.py build
}
package() {
    cd "${srcdir}/${pkgname_}"
    python3 setup.py install --root="${pkgdir}" --optimize=1
}
pkgver() {
  cd "${srcdir}/${pkgname_}"
  ( set -o pipefail
    git describe --long 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  )
}
