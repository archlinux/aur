# Maintainer: Sebastian Korotkiewicz <skorotkiewicz@gmail.com>
pkgname=printcraft-bin
_pkgname=pdfcraft
pkgver=0.13.0
pkgrel=1
pkgdesc='PdfCraft PDF viewer and editor (prebuilt binaries, formerly PrintCraft)'
arch=('x86_64' 'aarch64')
url="https://github.com/storytold/$_pkgname"
license=('MIT OR Apache-2.0' 'OFL-1.1' 'LicenseRef-ArtCraft-brand' 'ISC' 'BSD-3-Clause')
depends=('glibc' 'gcc-libs' 'hicolor-icon-theme' 'libxkbcommon' 'libxkbcommon-x11'
         'libx11' 'libxcursor' 'libxi' 'libxrandr' 'wayland'
         'libglvnd' 'vulkan-icd-loader' 'dbus')
optdepends=('vulkan-driver: hardware-accelerated Vulkan rendering'
            'xdg-desktop-portal: native file dialogs'
            'xdg-utils: open external links')
options=(!strip)
provides=("$_pkgname=$pkgver" "printcraft=$pkgver")
conflicts=('pdfcraft' 'pdfcraft-bin' 'printcraft')

source=("$_pkgname-$pkgver-NOTICE.txt::https://raw.githubusercontent.com/storytold/$_pkgname/v$pkgver/NOTICE"
        "$_pkgname-$pkgver-LICENSE-brand.txt::https://raw.githubusercontent.com/storytold/$_pkgname/v$pkgver/docs/brand/LICENSE-brand.txt"
        "$_pkgname-$pkgver-LICENSE-app-icon.txt::https://raw.githubusercontent.com/storytold/$_pkgname/v$pkgver/assets/app-icon/LICENSE.txt"
        "$_pkgname-$pkgver-OFL-DancingScript.txt::https://raw.githubusercontent.com/storytold/$_pkgname/v$pkgver/assets/fonts/OFL-DancingScript.txt"
        "$_pkgname-$pkgver-OFL-Inter.txt::https://raw.githubusercontent.com/storytold/$_pkgname/v$pkgver/assets/fonts/OFL-Inter.txt"
        "$_pkgname-$pkgver-OFL-JetBrainsMono.txt::https://raw.githubusercontent.com/storytold/$_pkgname/v$pkgver/assets/fonts/OFL-JetBrainsMono.txt"
        "$_pkgname-$pkgver-LICENSE-lucide.txt::https://raw.githubusercontent.com/storytold/$_pkgname/v$pkgver/assets/icons/LICENSE-lucide.txt"
        "$_pkgname-$pkgver-LICENSE-FOXIT.txt::https://raw.githubusercontent.com/storytold/$_pkgname/v$pkgver/vendor/hayro-interpret/assets/LICENSE_FOXIT")
source_x86_64=("$url/releases/download/v$pkgver/$_pkgname-$pkgver-linux-x86_64.tar.gz")
source_aarch64=("$url/releases/download/v$pkgver/$_pkgname-$pkgver-linux-aarch64.tar.gz")
sha256sums=('496946cff190a3fec32fe0241ea60d40539c73a9da1865073eb0c73ee822c8d5'
            '0f33f48e7a96cd359d4e4e5b11424b13cebeb59cc70c77928186695e4173585c'
            'b768acafe6cbad8247eedf86b5b5381feefcd4ee0f8c7808b86811bc687cf37b'
            '6f090277c00af96651ce6dbcc38ff1591047a3bffef486e80b6a32e8276a8201'
            '262481e844521b326f5ecd053e59b98c8b2da78c8ee1bdbb6e8174305e54935a'
            'a76abf002c49097d146e86740a3105a5d00450b1592e820a1109a8c5680cd697'
            'b495047bd93a9b06913511076f504daba17d5bbeb3e0650f3bb53a4220329c57'
            'b578cdd2345840ada550bd12519533812320d5f1d21cf4c1c7e1b1b0a31c98b7')
sha256sums_x86_64=('598519ea2bc77c66ca9a906241e1fe3eccf745f50627ce3cdbd5b5e675a456d3')
sha256sums_aarch64=('12efbe4c18d965c54b2b848aa4321880b967370443973b42a5ca4aa0d7959248')

package() {
  cd "$srcdir/$_pkgname-$pkgver-linux-$CARCH"

  install -dm755 "$pkgdir/usr"
  cp -a bin share "$pkgdir/usr/"
  ln -s pdfcraft "$pkgdir/usr/bin/printcraft"
  ln -s pdfcraft-cli "$pkgdir/usr/bin/printcraft-cli"
  install -Dm644 share/doc/$_pkgname/LICENSE-* -t "$pkgdir/usr/share/licenses/$pkgname/"
  install -Dm644 "$srcdir"/*.txt -t "$pkgdir/usr/share/licenses/$pkgname/"
}
