pkgname=svg2sif-git
pkgver=r56.0221e90
pkgrel=2
pkgdesc='An Inkscape extension that converts SVG files to Synfig Animation Studio (.sif) files.'
arch=(any)
url='https://github.com/nikitakit/svg2sif'
license=('GPL')
depends=(inkscape python)
makedepends=(git)
conflicts=(${pkgname%-git})
provides=(${pkgname%-git})
source=("git+$url.git")
md5sums=(SKIP)

pkgver(){
  cd ${pkgname%-git}
  set -o pipefail
  git describe --long 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}
package(){
  cd ${pkgname%-git}
  install -dm755 "$pkgdir"/usr/share/inkscape/extensions
  cp -r *.py *.inx "$pkgdir"/usr/share/inkscape/extensions
  install -Dm755 svg2sif_compare "$pkgdir/usr/bin/svg2sif_compare"
}

