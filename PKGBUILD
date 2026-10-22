# Maintainer: Sebastian Korotkiewicz <skorotkiewicz@gmail.com>
pkgname=designcraft-bin
_pkgname=${pkgname%-bin}
pkgver=0.11.0
pkgrel=1
pkgdesc='Page layout and desktop publishing (prebuilt binaries)'
arch=('x86_64' 'aarch64')
url="https://github.com/storytold/$_pkgname"
license=('MIT OR Apache-2.0' 'OFL-1.1' 'LicenseRef-ArtCraft-brand')
depends=('glibc' 'gcc-libs' 'libxkbcommon' 'libxkbcommon-x11'
         'libx11' 'libxcursor' 'libxi' 'libxrandr' 'wayland'
         'libglvnd' 'vulkan-icd-loader' 'dbus')
optdepends=('vulkan-driver: hardware-accelerated Vulkan rendering'
            'xdg-desktop-portal: native file dialogs'
            'xdg-utils: open external links')
options=(!strip)
provides=("$_pkgname=$pkgver")
conflicts=("$_pkgname")

source=("$_pkgname-$pkgver-NOTICE.txt::https://raw.githubusercontent.com/storytold/$_pkgname/v$pkgver/NOTICE"
        "$_pkgname-$pkgver-LICENSE-brand.txt::https://raw.githubusercontent.com/storytold/$_pkgname/v$pkgver/docs/brand/LICENSE-brand.txt"
        "$_pkgname-$pkgver-LICENSE-app-icon.txt::https://raw.githubusercontent.com/storytold/$_pkgname/v$pkgver/assets/app-icon/LICENSE.txt"
        "$_pkgname-$pkgver-OFL-Inter.txt::https://raw.githubusercontent.com/storytold/$_pkgname/v$pkgver/assets/fonts/OFL-Inter.txt"
        "$_pkgname-$pkgver-OFL-JetBrainsMono.txt::https://raw.githubusercontent.com/storytold/$_pkgname/v$pkgver/assets/fonts/OFL-JetBrainsMono.txt"
        "$_pkgname-$pkgver-OFL-SourceSans3.txt::https://raw.githubusercontent.com/storytold/$_pkgname/v$pkgver/assets/fonts/OFL-SourceSans3.txt"
        "$_pkgname-$pkgver-OFL-SourceSerif4.txt::https://raw.githubusercontent.com/storytold/$_pkgname/v$pkgver/assets/fonts/OFL-SourceSerif4.txt")
source_x86_64=("$url/releases/download/v$pkgver/$_pkgname-$pkgver-linux-x86_64.tar.gz")
source_aarch64=("$url/releases/download/v$pkgver/$_pkgname-$pkgver-linux-aarch64.tar.gz")
sha256sums=('b7de6a3c581be46591387bf9e6b4160c9facc7aeb274c2c250ee62caf0baf562'
            '68fb0e786130f8ead0350a352f66d7027d0f8a8ebebcf30d51de9146405f670e'
            'eb3f3cfc6437fd370e31ca8449c7312314c191d15347bd70934d9ce2df5331bd'
            '262481e844521b326f5ecd053e59b98c8b2da78c8ee1bdbb6e8174305e54935a'
            'a76abf002c49097d146e86740a3105a5d00450b1592e820a1109a8c5680cd697'
            '56af9b9c6715597e458284a474dc118a50a4150e9d547c70f7b4a33c3e6a9328'
            'c21d7293d87b6d7ab1d0229a2f55b77f33a7613a6a4e66f6693d68d7d8d09464')
sha256sums_x86_64=('12076f89ce445af5cf96c0048701a7d48373dccbd524de19fe2308601b554d58')
sha256sums_aarch64=('0f529995352cf50b5756906c2ef2691d80d01192d0bab9cf1fd0f1f58ef8f12a')

package() {
  cd "$srcdir/$_pkgname-$pkgver-linux-$CARCH"

  install -dm755 "$pkgdir/usr"
  cp -a bin share "$pkgdir/usr/"
  install -Dm644 share/doc/$_pkgname/LICENSE-* -t "$pkgdir/usr/share/licenses/$pkgname/"
  install -Dm644 "$srcdir"/*.txt -t "$pkgdir/usr/share/licenses/$pkgname/"
}
