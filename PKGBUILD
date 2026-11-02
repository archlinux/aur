# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
pkgname=universal-android-debloater-bin
pkgver=1.3.0
pkgrel=1
pkgdesc="Cross-platform GUI written in Rust using ADB to debloat non-rooted Android devices."
arch=('x86_64')
url="https://github.com/Universal-Debloater-Alliance/universal-android-debloater-next-generation"
license=('GPL-3.0-or-later')
depends=(
  'android-tools'
  'libgcc'
)
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
source=("uad-cli-$pkgver-linux.tar.gz::$url/releases/download/v$pkgver/uad-cli-linux.tar.gz"
        "uad-cli-$pkgver-linux-checksum::$url/releases/download/v$pkgver/uad-cli-linux-checksum"
        "uad-ng-$pkgver-noselfupdate-linux.tar.gz::$url/releases/download/v$pkgver/uad-ng-noselfupdate-linux.tar.gz"
        "uad-ng-$pkgver-noselfupdate-linux-checksum::$url/releases/download/v$pkgver/uad-ng-noselfupdate-linux-checksum"
        "uad-ng-$pkgver.png::https://raw.githubusercontent.com/Universal-Debloater-Alliance/universal-android-debloater-next-generation/main/resources/assets/logo-dark.png"
        "uad-ng.desktop")
sha256sums=('ebfbcb2e30a58a4a826e8c998d3d5d14b20a83e61132368f379f4dbe8d7e65a7'
            '8152994506151474a285a4fd050a051ed2445be737f7817044c5edcced652c58'
            '201ef5417bb8717424107331fc538e262933d9a58aa14c4877f3b66dce99774d'
            '1a9078807601584bb526204b56139c717210bfc90de4168df93031007ab6147d'
            '019c4df893dca5b54557c381881d7946b7a53ebf5b610cc04d61c2980c1a22ec'
            '8d5d790fffd35101af340792d081f8f75b61b1579bc8f89acab818f03f1071ea')

prepare() {
  sha256sum -c "uad-cli-$pkgver-linux-checksum"
  sha256sum -c "uad-ng-$pkgver-noselfupdate-linux-checksum"
}

package() {
  install -Dm755 "$srcdir/uad-cli-linux" "$pkgdir/usr/bin/uad"
  install -Dm755 "$srcdir/uad-ng-noselfupdate-linux" "$pkgdir/usr/bin/uad-ng"
  install -Dm644 "$srcdir/uad-ng-$pkgver.png" "${pkgdir}/usr/share/pixmaps/uad-ng.png"
  install -Dm644 "$srcdir/uad-ng.desktop" -t "$pkgdir/usr/share/applications/"
}
