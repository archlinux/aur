# Maintainer: Maciej Dems <macdems@gmail.com>
pkgname=z-library-bin
pkgver=2.0.0
pkgrel=3
pkgdesc="Z-library application"
arch=('x86_64')
url="https://singlelogin.rs/z-access"
depends=('gtk3' 'libnotify' 'nss' 'libxss' 'libxtst' 'at-spi2-core' 'util-linux-libs' 'libsecret' 'libappindicator-gtk3')
license=('ISC')
source=("zlibrary-setup-latest_${pkgver}.deb::https://s3proxy.cdn-zlib.sk/te_public_files/soft/linux/zlibrary-setup-latest.deb")
sha256sums=('d3d6c845fafd3a16bd1cb28451bfa8295767c6942fb0449930ee51db54b94c7f')

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
