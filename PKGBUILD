# Maintainer: Nebulosa <nebulosa2007 at yandex dot ru>

pkgname=improve-imgsli-git
pkgver=1.0.r44.g5684f2a
pkgrel=1
pkgdesc="Improved free before/after slider albums"
arch=(any)
url="https://github.com/Loganavter/${pkgname%-git}"
license=(MIT)
depends=(
  bash
  hicolor-icon-theme
  python
  python-mpmath
  python-networkx
  python-numpy
  python-pillow
  python-pyqt6
  python-pyqt6-sip
)
makedepends=(git)
provides=(${pkgname%-git})
conflicts=(${pkgname%-git})
options=(!debug)
source=(${pkgname%-git}::git+$url.git)
b2sums=('SKIP')

pkgver() {
  git -C ${pkgname%-git} describe --long --tags --abbrev=7 | sed 's/\([^-]*-g\)/r\1/;s/-/./g;s/^v//'
}

prepare() {
  printf "#!/bin/sh\n\nexec python /usr/lib/improve-imgsli/Improve_ImgSLI.py \"\$@\"" > ${pkgname%-git}/${pkgname%-git}
  sed -i 's|Exec=|Exec=/usr/bin/|' ${pkgname%-git}/${pkgname%-git}.desktop
}

package() {
  cd ${pkgname%-git}
  install -vDm 755 ${pkgname%-git}         -t "$pkgdir"/usr/bin/
  install -vDm 644 Improve_ImgSLI.py       -t "$pkgdir"/usr/lib/${pkgname%-git}
  install -vDm 644 clickable_label.py      -t "$pkgdir"/usr/lib/${pkgname%-git}
  install -vDm 644 image_comparison_app.py -t "$pkgdir"/usr/lib/${pkgname%-git}
  install -vDm 644 image_processing.py     -t "$pkgdir"/usr/lib/${pkgname%-git}
  install -vDm 644 flag_icons.py           -t "$pkgdir"/usr/lib/${pkgname%-git}
  install -vDm 644 translations.py         -t "$pkgdir"/usr/lib/${pkgname%-git}
  install -vDm 644 ${pkgname%-git}.desktop -t "$pkgdir"/usr/share/applications
  install -vDm 644 33.png                     "$pkgdir"/usr/share/icons/hicolor/256x256/apps/${pkgname%-git}.png
# install -vDm 644 LICENSE                 -t "$pkgdir"/usr/share/licenses/${pkgname%-git} 
}
