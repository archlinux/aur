# Maintainer: Maciej Dems <macdems@gmail.com>
pkgname=z-library-bin
pkgver=2.4.3
pkgrel=1
pkgdesc="Z-library application"
arch=('x86_64')
url="https://z-lib.fm/z-access  "
depends=('gtk3' 'libnotify' 'nss' 'libxss' 'libxtst' 'at-spi2-core' 'util-linux-libs' 'libsecret' 'libappindicator-gtk3')
license=('ISC')
source=("zlibrary-setup-latest_${pkgver}.deb::https://s3proxy.cdn-zlib.sk/te_public_files/soft/linux/zlibrary-setup-latest.deb")
sha256sums=('3b2c0625d554006c4af82d786a46cbce192dff9404ebe95c84f1ed7a4b0e2cb6')

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
