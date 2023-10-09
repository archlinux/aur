# Maintainer: Maciej Dems <macdems@gmail.com>
pkgname=z-library-bin
pkgver=1.0.2
pkgrel=1
pkgdesc="Z-library application"
arch=('x86_64')
url="https://singlelogin.se"
depends=('gtk3' 'libnotify' 'nss' 'libxss' 'libxtst' 'at-spi2-core' 'util-linux-libs' 'libsecret' 'libappindicator-gtk3')
license=('ISC')
source=("https://go-to-zlibrary.se/soft/zlibrary-setup-latest.deb")
sha256sums=('7fbdcefcea789dea4e2cde07593fdfa2c35626e94d03e017047ee96f597fefe3')

prepare() {
    mkdir -p "$srcdir/z-library"
    cd "$srcdir/z-library"
    ar p ../zlibrary-setup-latest.deb data.tar.xz | tar xJ
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
