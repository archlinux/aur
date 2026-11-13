# Maintainer: MicDock authors <milo@ilom.nl>
pkgname=micdock-bin
pkgver=0.12.0
pkgrel=1
pkgdesc="Manage a RØDE Wireless GO II: recordings, record mode, firmware (unofficial)"
arch=('x86_64' 'aarch64')
url="https://github.com/micdock/micdock"
license=('GPL-3.0-or-later')
depends=('alsa-lib' 'gcc-libs' 'glibc' 'libxkbcommon')
optdepends=('ffmpeg: MP3 export')
provides=('micdock')
conflicts=('micdock')
options=('!debug' '!strip')  # prebuilt release binaries
source_x86_64=("$url/releases/download/v$pkgver/micdock-$pkgver-x86_64-linux.tar.gz")
source_aarch64=("$url/releases/download/v$pkgver/micdock-$pkgver-aarch64-linux.tar.gz")
sha256sums_x86_64=('4787bf4d172ccbb834e61beedde6f1e75fb75ac65f07f5a7e79d2ab0bd6fe00f')
sha256sums_aarch64=('1a46c58d16b88da9d5596364afba94ec6707a8a145184a67363c99ff4c25178c')

package() {
  cd "micdock-$pkgver-$CARCH-linux"
  install -Dm755 bin/* -t "$pkgdir/usr/bin/"
  install -Dm644 share/applications/micdock.desktop -t "$pkgdir/usr/share/applications/"
  cp -r --no-preserve=ownership share/micdock "$pkgdir/usr/share/"
  # device access for the logged-in user; pacman's udev hook reloads the rules
  install -Dm644 70-rode.rules -t "$pkgdir/usr/lib/udev/rules.d/"
  install -Dm644 README.md PROTOCOL.md -t "$pkgdir/usr/share/doc/micdock/"
}
