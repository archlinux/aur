pkgname=universal-android-debloater-bin
pkgver=1.1.2
pkgrel=1
pkgdesc="Cross-platform GUI written in Rust using ADB to debloat non-rooted Android devices."
arch=('x86_64')
url="https://github.com/Universal-Debloater-Alliance/universal-android-debloater-next-generation"
license=('GPL-3.0-or-later')
depends=('android-tools')
provides=('universal-android-debloater')
conflicts=('universal-android-debloater')
source=("$url/releases/download/v$pkgver/uad-ng-noselfupdate-linux.tar.gz"
        "$url/releases/download/v$pkgver/uad-ng-noselfupdate-linux-checksum"
        "uad-ng.png::https://raw.githubusercontent.com/Universal-Debloater-Alliance/universal-android-debloater-next-generation/main/resources/assets/logo-dark.png"
        "uad-ng.desktop")
sha256sums=('SKIP'
            'SKIP'
            '019c4df893dca5b54557c381881d7946b7a53ebf5b610cc04d61c2980c1a22ec'
            '8d5d790fffd35101af340792d081f8f75b61b1579bc8f89acab818f03f1071ea')

prepare() {
  cd "${srcdir}"
  sha256sum -c uad-ng-noselfupdate-linux-checksum
}

package() {
  install -Dm755 "${srcdir}/uad-ng-noselfupdate-linux" -T "${pkgdir}/usr/bin/uad-ng"
  install -Dm644 "${srcdir}/uad-ng.desktop" -t "${pkgdir}/usr/share/applications"
  install -Dm644 "${srcdir}/uad-ng.png" -t "${pkgdir}/usr/share/pixmaps"
}
