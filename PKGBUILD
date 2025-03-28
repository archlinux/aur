# Maintainer: m8D2 <omui (at) proton mail (dot) com>
# Contributor: Raphael Scholer <rascholer@gmail.com>

pkgname="elementary-xfce-icons-git"
pkgver=0.20.1.17.g3f283396
pkgrel=2
pkgdesc='Elementary icon theme with improved Xfce support (Git version)'
arch=('any')
url="https://github.com/shimmerproject/elementary-xfce"
license=(GPL3)
makedepends=(gtk3 optipng git)
depends=(adwaita-icon-theme)
provides=(elementary-xfce-icons)
source=("$pkgname::git+$url.git")
sha256sums=('SKIP')

pkgver() {
    cd "$pkgname"
    # Get the version from the latest tag, followed by commit count and hash
    git describe --long --tags | sed 's/^v//;s/-/./g'
}

build() {
    cd "$pkgname"
    ./configure --prefix=/usr
    make
}

package() {
    cd "$pkgname"
    make DESTDIR="$pkgdir" install

    # Remove unnecessary files.
    find "$pkgdir/usr/share/icons" \
    \( \
      -name 'AUTHORS' \
      -o -name 'CONTRIBUTORS' \
      -o -name 'LICENSE' \
    \) -delete
}
