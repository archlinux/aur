# Maintainer: Maciej Dems <macdems@gmail.com>
pkgname=z-library-bin
pkgver=2.4.2
pkgrel=1
pkgdesc="Z-library application"
arch=('x86_64')
url="https://z-lib.fm/z-access  "
depends=('gtk3' 'libnotify' 'nss' 'libxss' 'libxtst' 'at-spi2-core' 'util-linux-libs' 'libsecret' 'libappindicator-gtk3')
license=('ISC')
source=("zlibrary-setup-latest_${pkgver}.deb::https://s3proxy.cdn-zlib.sk/te_public_files/soft/linux/zlibrary-setup-latest.deb")
sha256sums=('d2c0fb2c835ca6db7aef43a173cd74acda2d52e710e46126334851e23c2d87d3')

prepare() {
    mkdir -p "$srcdir/z-library"
    cd "$srcdir/z-library"
    ar p ../zlibrary-setup-latest_${pkgver}.deb data.tar.xz | tar xJ
}

# build() {
# }

package() {
    cd "$srcdir/z-library"
    cp -r usr opt "$pkgdir/"
    mkdir -p "$pkgdir/usr/bin"
    ln -sf '../../opt/Z-Library/z-library' "$pkgdir/usr/bin/z-library"

}

post_install() {
  update-mime-database usr/share/mime &>/dev/null
  update-desktop-database -q
}

post_upgrade() {
  post_install "$1"
}

post_remove() {
  post_install "$1"
}
