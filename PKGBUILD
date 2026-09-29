# Contributor: Raphael Scholer <rascholer@gmail.com>
# Maintainer: m8D2 <omui (at) proton mail (dot) com>

pkgname="elementary-xfce-icons"
pkgver=0.23
pkgrel=1
pkgdesc='Elementary icon theme with improved Xfce support'
arch=('any')
url="https://github.com/shimmerproject/elementary-xfce"
license=('GPL-3.0-or-later')
depends=(hicolor-icon-theme)
makedepends=(gdk-pixbuf2 librsvg optipng)
source=("$pkgname-$pkgver.tar.gz::${url}/archive/v$pkgver.tar.gz")
sha256sums=('2f4e6b6e4e46692c18c2f41cf7b7c9a2bac4433d5528e98c8a301631c5b285d2')

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
