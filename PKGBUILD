# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
pkgname=tvrenamer-bin
pkgver=1.0b6
pkgrel=1
pkgdesc="A Java GUI utility to rename TV episodes from TV listings"
arch=('x86_64' 'aarch64')
url="https://tvrenamer.org"
license=('GPL-2.0-or-later')
depends=('java-runtime>=21')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
source=("${pkgname%-bin}.desktop"
        "${pkgname%-bin}.png")
source_x86_64=("https://github.com/tvrenamer/tvrenamer/releases/download/v$pkgver/TVRenamer-$pkgver-linux-x86_64.zip")
source_aarch64=("https://github.com/tvrenamer/tvrenamer/releases/download/v$pkgver/TVRenamer-$pkgver-linux-aarch64.zip")
sha256sums=('8876483be682b55125c0a42f9129654319a3690df34182eaa5870c5a96c585da'
            'b3a5d18a04c1b8af204488e753210e104e9591d6703e5830504fc334231efabd')
sha256sums_x86_64=('3171c839d53fb21a861e17b10f15b5970a89ead33327c356ec1cab2e24bd8d7c')
sha256sums_aarch64=('ba10b0218107a2234218574dffa3dc9eb8dd5f1f5f29c1d8bcffe0c6d36327a5')

package() {
  cd "TVRenamer-$pkgver-linux-${CARCH}"
  install -Dm755 "bin/${pkgname%-bin}" -t "$pkgdir/usr/share/java/${pkgname%-bin}/bin/"
  install -Dm644 lib/*.jar -t "$pkgdir/usr/share/java/${pkgname%-bin}/lib/"
  install -Dm644 "$srcdir/${pkgname%-bin}.desktop" -t "$pkgdir/usr/share/applications"
  install -Dm644 "$srcdir/${pkgname%-bin}.png" -t "$pkgdir/usr/share/pixmaps"

  install -d "$pkgdir/usr/bin"
  ln -s "/usr/share/java/${pkgname%-bin}/bin/${pkgname%-bin}" "$pkgdir/usr/bin/"
}
