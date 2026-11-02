# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
pkgname=universal-android-debloater-bin
pkgver=1.3.1
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
sha256sums=('6aa187b0679c77601cd12931c1d02aba6e12fa0c804c9a85c58a0d5808dc2766'
            'd5692b91aac7253029071b721b4e7e6f913f3b599a6c755e12587be4c90ed85f'
            'f4dd84f4bbce870e3be9a6803b8406a3685b0b7c17003de7c2ff885b610404cc'
            '77991bf72b85d958260ec6fe789f3db32d4fb273d36e200a555cc9d83bc0995a'
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
