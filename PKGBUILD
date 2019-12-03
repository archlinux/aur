# Maintainer: Raphael Scholer <rascholer@gmail.com>
# Maintainer: m8D2 <omui (at) proton mail (dot) com>

pkgname="elementary-xfce-icons"
pkgver=0.14
pkgrel=1
pkgdesc='Elementary icon theme with improved Xfce support'
arch=('any')
url="https://github.com/shimmerproject/elementary-xfce"
license=(GPL2)
makedepends=(gtk3 optipng)
depends=(adwaita-icon-theme)
conflicts=(elementary-xfce-icons-git)
source=("${url}/archive/v$pkgver.tar.gz")
sha256sums=('e978f8f4e62387291943f8ae4e95362798415e199a9113252660d1c1dd0db8d6')

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
