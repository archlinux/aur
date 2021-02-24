# Maintainer: Marc ROGER de CAMPAGNOLLE <fora at mrdc dot fr>
# Contributor: zan <zan at 420blaze dot it>

pkgname=qt-avif-image-plugin-git
_pkgname=qt-avif-image-plugin
pkgver=r81.cc58582
pkgrel=1
pkgdesc='Qt plug-in to allow Qt and KDE based applications to read/write AVIF images'
arch=('x86_64')
url="https://github.com/novomesk/$_pkgname"
license=('BSD')
depends=('qt5-base' 'libavif')
makedepends=(git)
source=("git+https://github.com/novomesk/$_pkgname.git")
sha256sums=('SKIP')

pkgver() {
  cd "$_pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "$_pkgname"
  ./build_libqavif_dynamic.sh
}

package() {
  cd "$_pkgname"
  install -Dm755 "$srcdir/$_pkgname/plugins/imageformats/libqavif.so" "$pkgdir/usr/lib/qt/plugins/imageformats/libqavif.so"
  install -Dm755 -t "$pkgdir/usr/share/kservices5/qimageioplugins/" $srcdir/$_pkgname/share/kservices5/qimageioplugins/*.desktop
  install -Dm644 "$srcdir/$_pkgname/LICENSE" "$pkgdir/usr/share/licenses/$_pkgname/LICENSE"
}
