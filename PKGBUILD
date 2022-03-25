# Maintainer: Raphael Scholer <rascholer@gmail.com>
# Maintainer: m8D2 <omui (at) proton mail (dot) com>

pkgname="elementary-xfce-icons"
pkgver=0.16
pkgrel=1
pkgdesc='Elementary icon theme with improved Xfce support'
arch=('any')
url="https://github.com/shimmerproject/elementary-xfce"
license=(GPL2)
makedepends=(gtk3 optipng)
depends=(adwaita-icon-theme)
conflicts=(elementary-xfce-icons-git)
source=("$pkgname-$pkgver.tar.gz::${url}/archive/v$pkgver.tar.gz")
sha256sums=('6dc0d6fb37965f85f25e2cf8254ee3159508e3680906e5a40a748a6d2c8737f7')

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
