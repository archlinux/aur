# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
pkgname=universal-android-debloater-bin
pkgver=1.2.0
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
source=("uad-ng-$pkgver-noselfupdate-linux.tar.gz::$url/releases/download/v$pkgver/uad-ng-noselfupdate-linux.tar.gz"
        "uad-ng-$pkgver-noselfupdate-linux-checksum::$url/releases/download/v$pkgver/uad-ng-noselfupdate-linux-checksum"
        "uad-ng-$pkgver.png::https://raw.githubusercontent.com/Universal-Debloater-Alliance/universal-android-debloater-next-generation/main/resources/assets/logo-dark.png"
        "uad-ng.desktop")
sha256sums=('980273195eb39ae43c776159252d67be0a5eea31faf88b600c2f9218cb099314'
            '7793a2dab004dfd792ba47616413cd77b975d889ecf71a411e6bdf017f8476b7'
            '019c4df893dca5b54557c381881d7946b7a53ebf5b610cc04d61c2980c1a22ec'
            '8d5d790fffd35101af340792d081f8f75b61b1579bc8f89acab818f03f1071ea')

prepare() {
  sha256sum -c "uad-ng-$pkgver-noselfupdate-linux-checksum"
}

package() {
  install -Dm755 "$srcdir/uad-ng-noselfupdate-linux" "$pkgdir/usr/bin/uad-ng"
  install -Dm644 "$srcdir/uad-ng-$pkgver.png" "${pkgdir}/usr/share/pixmaps/uad-ng.png"
  install -Dm644 "$srcdir/uad-ng.desktop" -t "$pkgdir/usr/share/applications/"
}
