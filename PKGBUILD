# Contributor: Marcell Meszaros < marcell.meszaros AT runbox.eu >
# Contributor: timescam <timescam at duck dot com>

pkgname=noto-fonts-emoji-apple
_pkgname=noto-fonts-emoji
pkgver=16.4beta
_commit=02d3fb40bca2c579e0110b98aeea812ca14e7851
pkgrel=2
epoch=2
pkgdesc="Noto Fonts with emojis replaced with Apple's, derived form Magisk_iOS_Emoji"
arch=(any)
url="https://gitlab.com/timescam/noto-fonts-emoji-apple"
license=('OFL')
provides=(
  'emoji-font'
  'noto-fonts-emoji'
)
conflicts=('noto-fonts-emoji')
makedepends=('git')
source=("$pkgname::git+$url.git#commit=${_commit}"
        "LICENSE::https://raw.githubusercontent.com/google/fonts/89e363dd92c5fe6d8e4d150951f19a4e4aa65587/ofl/notocoloremoji/OFL.txt")
b2sums=('SKIP'
        '5a1f5f5095a12e0039a4166cb4b58e88f1928b4b84924275a29e848cfdd663c6278c5e29f5ef533d11640d59494f10a2c2e307b17b5d95038a1b2dae987e07da')

package() {
  mkdir -p "$pkgdir"/usr/share/fonts/noto
  install -m644 "$srcdir/$pkgname/NotoColorEmoji.ttf" "$pkgdir"/usr/share/fonts/noto

  # Install fontconfig files
  mkdir -p "$pkgdir"/etc/fonts/conf.{avail,d}
  install -m644 "$srcdir/$pkgname"/66-noto-color-emoji.conf -t "$pkgdir"/etc/fonts/conf.avail/
  ln -rs "$pkgdir"/etc/fonts/conf.avail/* "$pkgdir"/etc/fonts/conf.d

  # Install license
  install -Dm644 "$srcdir"/LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}/"
}
