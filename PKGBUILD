# Maintainer: Raphael Scholer <rascholer@gmail.com>
# Maintainer: m8D2 <omui (at) proton mail (dot) com>

pkgname="elementary-xfce-icons"
pkgver=0.15.1
pkgrel=1
pkgdesc='Elementary icon theme with improved Xfce support'
arch=('any')
url="https://github.com/shimmerproject/elementary-xfce"
license=(GPL2)
makedepends=(gtk3 optipng)
depends=(adwaita-icon-theme)
conflicts=(elementary-xfce-icons-git)
source=("$pkgname-$pkgver.tar.gz::${url}/archive/v$pkgver.tar.gz")
sha256sums=('75937a08c4618dac07a91e4de60884f890c332c8f367101b5f81a5e3b3c376d9')

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
