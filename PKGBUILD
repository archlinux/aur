# Maintainer: Sainnhe Park <sainnhe@gmail.com>

pkgname=capitaine-cursors-sainnhe-git
pkgver=5.r19.g9b12de9
pkgrel=1
pkgdesc="Sainnhe's fork of capitaine cursor theme, patched with some additional variants (Gruvbox, Nord, Palenight)"
arch=(any)
url="https://github.com/sainnhe/capitaine-cursors"
license=(LGPL3)
source=("git+${url}.git#branch=master")
provides=('capitaine-cursors')
conflicts=('capitaine-cursors')
makedepends=(git libx11 libxcursor libpng nodejs yarn python python-pip)
sha256sums=('SKIP')

pkgver() {
  cd "${srcdir}/capitaine-cursors"
  git describe origin/master --long --tags | sed 's/^r//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

package() {
  cd "${srcdir}/capitaine-cursors"
  install -Ddm755 "$pkgdir/usr/share/icons"
  for style in Default Nord Gruvbox Palenight ; do
    ./patch.sh "${style}"
    make unix
    cp -dr --no-preserve=ownership "themes/*" "$pkgdir/usr/share/icons/"
    git checkout -- .
  done
}
