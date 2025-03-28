# Maintainer: Raphael Scholer <rascholer@gmail.com>
# Maintainer: m8D2 <omui (at) proton mail (dot) com>

pkgname="elementary-xfce-icons"
pkgver=0.21
pkgrel=3
pkgdesc='Elementary icon theme with improved Xfce support'
arch=('any')
url="https://github.com/shimmerproject/elementary-xfce"
license=(GPL3)
makedepends=(gtk3 optipng)
depends=(adwaita-icon-theme)
source=("$pkgname-$pkgver.tar.gz::${url}/archive/v$pkgver.tar.gz")
sha256sums=('54061d52495a67e945cdbadeef7fe72395e0a8aebf30ed140cc614093c1597f5')

build() {
    cd "elementary-xfce-$pkgver"

    ./configure --prefix=/usr
    make
}

package() {
    cd "elementary-xfce-$pkgver"

    make DESTDIR="$pkgdir" install

    # Remove unnecessary files.
    find "$pkgdir/usr/share/icons" \
    \( \
      -name 'AUTHORS' \
      -o -name 'CONTRIBUTORS' \
      -o -name 'LICENSE' \
    \) -delete
}
