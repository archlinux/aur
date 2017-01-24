# Maintainer: archlinux.info:tdy

pkgname=muttator
pkgver=1.3.1
pkgrel=1
pkgdesc="Make Thunderbird look and behave like Vim"
arch=(any)
url=http://vimperator.org/muttator
license=(MIT)
depends=("thunderbird>=38.0")
source=(https://addons.mozilla.org/thunderbird/downloads/file/370889/$pkgname-$pkgver-tb.xpi)
noextract=($pkgname-$pkgver-tb.xpi)
sha256sums=(b1dd1d3d9def09da763136c69282a5e0f45c6e6fd950c76cfc4333b7cbe60c23)

package() {
  # install
  bsdtar -xf $pkgname-$pkgver-tb.xpi -C "$pkgdir" \
    -s ":^:usr/lib/thunderbird/extensions/muttator@mozdev.org/:"

  # license
  bsdtar -xf $pkgname-$pkgver-tb.xpi -C "$pkgdir" \
    -s ",^License.txt,usr/share/licenses/$pkgname/LICENSE," \
    License.txt

  # sanitize
  find "$pkgdir" -exec sh -c \
    "file '{}' | grep -qE 'ELF|executable|directory' && chmod 755 '{}' || chmod 644 '{}'" \;
  chown -R root:root "$pkgdir"
}
