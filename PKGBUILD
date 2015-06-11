# Maintainer: Brian Bidulock <bidulock@openss7.org>
# Contributor: Michal Kowalski <kowalski TOD michal TA gmail TOD com>

pkgname=zathura-ypb
pkgver=0.0.8.2.r30.gbef9bc4
pkgrel=2
pkgdesc="A lightweight GTK2 PDF viewer"
arch=('i686' 'x86_64')
url="https://github.com/ypb/zat"
license=('custom')
depends=('poppler-glib>=0.12.3' 'gtk2>=2.18.6' 'desktop-file-utils')
makedepends=('git')
install="zat.install"
source=("$pkgname::git+https://github.com/ypb/zat.git"
        "zat.desktop" "zat.png")
md5sums=('SKIP'
         '0044e854dc35d4b4e3ef712b455d2f79'
         'c98563fce7efa3d6ea4ffa9952cf17b8')

pkgver() {
  cd $pkgname
  git describe --long --tags | sed -r 's/([^-]*-g)/r\1/;s/-/./g'
}

build() {
  cd $pkgname
  make
}

package() {
  cd $pkgname
  make DESTDIR="$pkgdir" install
  install -Dm664 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 "$srcdir/zat.desktop" "$pkgdir/usr/share/applications/zat.desktop"
  install -Dm644 "$srcdir/zat.png" "$pkgdir/usr/share/pixmaps/zat.png"
}

# vim: set sw=2 et:
