# Maintainer: tinywrkb <tinywrkb@gmail.com>
# Contributor: Benoît Giraudou <bgiraudou@gmail.com>

pkgname=epub-thumbnailer-git
pkgver=r74.486111b
pkgrel=1
epoch=1
pkgdesc="EPUB e-books thumbnailer for file managers that make use of python-pillow"
arch=(any)
url="https://github.com/marianosimone/epub-thumbnailer"
license=(GPL3)
makedepends=(git)
source=("epub-thumbnailer::git+https://github.com/marianosimone/epub-thumbnailer.git")
md5sums=('SKIP')

pkgver() {
  cd epub-thumbnailer
  ( set -o pipefail
    git describe --long 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  )
}

package() {
  depends+=(python-pillow)
  cd epub-thumbnailer
  install -Dm755 src/epub-thumbnailer.py "${pkgdir}/usr/bin/epub-thumbnailer"
  install -Dm644 src/epub.thumbnailer -t "${pkgdir}/usr/share/thumbnailers/"
}
