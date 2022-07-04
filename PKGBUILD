# Maintainer: Raphael Scholer <rascholer@gmail.com>
# Maintainer: m8D2 <omui (at) proton mail (dot) com>

pkgname="elementary-xfce-icons"
pkgver=0.17
pkgrel=1
pkgdesc='Elementary icon theme with improved Xfce support'
arch=('any')
url="https://github.com/shimmerproject/elementary-xfce"
license=(GPL2)
makedepends=(gtk3 optipng)
depends=(adwaita-icon-theme)
conflicts=(elementary-xfce-icons-git)
source=("$pkgname-$pkgver.tar.gz::${url}/archive/v$pkgver.tar.gz")
#source=($pkgname-$pkgver::git+$url#commit=a222e1cb1bf489bef3677f1be023e0e3c27e54e3)
sha256sums=('51b98efc38aec720852c89f4e8622b4b019aa801f17ca06a5de7eaa212eecee0')

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
