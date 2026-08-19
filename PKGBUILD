# Maintainer: Maciej Dems <macdems@gmail.com>
pkgname=z-library-bin
pkgver=3.2.1
pkgrel=1
pkgdesc="Z-library application"
arch=('x86_64')
url="https://z-lib.fm/z-access  "
depends=('gtk3' 'libnotify' 'nss' 'libxss' 'libxtst' 'at-spi2-core' 'util-linux-libs' 'libsecret' 'libappindicator-gtk3')
license=('ISC')
#source=("zlibrary-setup-latest_${pkgver}.deb::https://s3proxy.cdn-zlib.sk/te_public_files/soft/linux/zlibrary-setup-latest.deb")
#source=("https://s3proxy-alp.cdn-zlib.sk/swfs_second_public_files/soft/desktop/Z-Library_${pkgver}_amd64.deb")
source=("https://dln1.ncdn.ec/general-files/soft/desktop/Z-Library_${pkgver}_amd64.deb")
sha256sums=('SKIP')

prepare() {
    mkdir -p "$srcdir/z-library"
    cd "$srcdir/z-library"
    ar p ../Z-Library_${pkgver}_amd64.deb data.tar.xz | tar xJ
}

# build() {
# }

package() {
    cd "$srcdir/z-library"
    cp -r usr opt "$pkgdir/"
    mkdir -p "$pkgdir/usr/bin"
    ln -sf '../../opt/Z-Library/Z-Library' "$pkgdir/usr/bin/z-library"

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
